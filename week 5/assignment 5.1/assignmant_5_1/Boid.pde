// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Boid class
// Methods for Separation, Cohesion, Alignment added

class Boid {

  PVector position, velocity, acceleration, correction;
  float radius;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed
  float colourR, colourG, colourB;
  //Obstacle obstacle;

  Boid(float x, float y) {
    acceleration = new PVector(0, 0);
    velocity = new PVector(random(-1, 1), random(-1, 1));
    position = new PVector(x, y);
    radius = 3.0;
    maxspeed = 3;
    maxforce = 0.05;
    colourR = random(255);                                            //randomization of coulors
    colourG = random(255);
    colourB = random(255);
  }

  void run(ArrayList<Boid> boids, Obstacle obstacle) {
    flock(boids, obstacle);
    update();
    render();
  }

  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    acceleration.add(force);
  }

  // We accumulate a new acceleration each time based on three rules
  void flock(ArrayList<Boid> boids, Obstacle obstacle) {
    PVector sep = separate(boids);   // Separation
    PVector ali = align(boids);      // Alignment
    PVector coh = cohesion(boids);   // Cohesion
    PVector avo = avoidance(obstacle);
    PVector bor = borders();
    // Arbitrarily weight these forces
    sep.mult(1.5);
    ali.mult(1.0);
    coh.mult(1.0);
    avo.mult(2);
    bor.mult(1.5);
    // Add the force vectors to acceleration
    applyForce(sep);
    applyForce(ali);
    applyForce(coh);
    applyForce(avo);
    applyForce(bor);
  }

  // Method to update position
  void update() {
    // Update velocity
    velocity.add(acceleration);
    // Limit speed
    velocity.limit(maxspeed);
    position.add(velocity);
    // Reset accelertion to 0 each cycle
    acceleration.mult(0);
  }

  // A method that calculates and applies a steering force towards a target
  // STEER = DESIRED MINUS VELOCITY
  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, position);  // A vector pointing from the position to the target
    // Normalize desired and scale to maximum speed
    desired.normalize();
    desired.mult(maxspeed);
    // Steering = Desired minus Velocity
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);  // Limit to maximum steering force
    return steer;
  }

  void render() {
    // Draw a triangle rotated in the direction of velocity
    float theta = velocity.heading2D() + radians(90);
    fill(175);
    stroke(0);
    pushMatrix();
    translate(position.x, position.y);
    rotate(theta);
    fill(colourR, colourG, colourB);                       //random colours for every particle and a lifespan
    ellipse(0, -radius*2, 7, 7);
    popMatrix();
  }

  //// Wraparound
  //void borders() {
  //  if (position.x < -radius) position.x = width+radius;
  //  if (position.y < -radius) position.y = height+radius;
  //  if (position.x > width+radius) position.x = -radius;
  //  if (position.y > height+radius) position.y = -radius;
  //}

  PVector borders() {
    
    PVector steer = new PVector(0, 0, 0);
    
    if (position.x < -radius+50) {
      correction = new PVector(maxspeed, velocity.y);
    } else if (position.x > width +radius -50) {
      correction = new PVector(-maxspeed, velocity.y);
    } 

    if (position.y < -radius +50) {
      correction = new PVector(velocity.x, maxspeed);
    } else if (position.y > height+radius -50) {
      correction = new PVector(velocity.x, -maxspeed);
    } 

    if (correction != null) {
      correction.normalize();
      correction.mult(maxspeed);
      steer = PVector.sub(correction, velocity);
      steer.limit(maxforce);
    }
    return steer;
  }  

  // Separation
  // Method checks for nearby boids and steers away
  PVector separate (ArrayList<Boid> boids) {
    float desiredseparation = 25.0f;
    PVector steer = new PVector(0, 0, 0);
    int count = 0;
    // For every boid in the system, check if it's too close
    for (Boid other : boids) {
      float d = PVector.dist(position, other.position);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < desiredseparation)) {
        // Calculate vector pointing away from neighbor
        PVector diff = PVector.sub(position, other.position);
        diff.normalize();
        diff.div(d);        // Weight by distance
        steer.add(diff);
        count++;            // Keep track of how many
      }
    }
    // Average -- divide by how many
    if (count > 0) {
      steer.div((float)count);
    }

    // As long as the vector is greater than 0
    if (steer.mag() > 0) {
      // Implement Reynolds: Steering = Desired - Velocity
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(velocity);
      steer.limit(maxforce);
    }
    return steer;
  }

  // Avoidance
  // Method checks for nearby boids and steers away
  PVector avoidance (Obstacle obstacle) {

    float desiredseparation = obstacle.radiusObstacle;
    PVector steer = new PVector(0, 0, 0);

    // For every boid in the system, check if it's too close
    float d = PVector.dist(position, obstacle.location);
    // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
    if ((d > 0) && (d < desiredseparation)) {
      // Calculate vector pointing away from neighbor
      PVector diff = PVector.sub(position, obstacle.location);
      diff.normalize();
      diff.div(d);        // Weight by distance !
      steer.add(diff);
    }

    // As long as the vector is greater than 0
    if (steer.mag() > 0) {
      // Implement Reynolds: Steering = Desired - Velocity

      steer.normalize();

      steer.mult(maxspeed);
      steer.sub(velocity);
      steer.limit(maxforce);
    }
    return steer;
  }


  // Alignment
  // For every nearby boid in the system, calculate the average velocity
  PVector align (ArrayList<Boid> boids) {
    float neighbordist = 50;
    PVector sum = new PVector(0, 0);
    int count = 0;
    for (Boid other : boids) {
      float d = PVector.dist(position, other.position);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.velocity);
        count++;
      }
    }
    if (count > 0) {
      sum.div((float)count);
      sum.normalize();
      sum.mult(maxspeed);
      PVector steer = PVector.sub(sum, velocity);
      steer.limit(maxforce);
      return steer;
    } else {
      return new PVector(0, 0);
    }
  }

  // Cohesion
  // For the average position (i.e. center) of all nearby boids, calculate steering vector towards that position
  PVector cohesion (ArrayList<Boid> boids) {
    float neighbordist = 50;
    PVector sum = new PVector(0, 0);   // Start with empty vector to accumulate all positions
    int count = 0;
    for (Boid other : boids) {
      float d = PVector.dist(position, other.position);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.position); // Add position
        count++;
      }
    }
    if (count > 0) {
      sum.div(count);
      return seek(sum);  // Steer towards the position
    } else {
      return new PVector(0, 0);
    }
  }
}
