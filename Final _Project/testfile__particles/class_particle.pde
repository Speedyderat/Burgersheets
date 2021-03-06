class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan, colourR, colourG, colourB;

  Particle(PVector l) {
    //[offset-up] For demonstration purposes we assign the Particle an initial velocity and constant acceleration.
    acceleration = new PVector(0, random(-0.05, 0.05));
    velocity = new PVector(random(-1, 1), random(-2, 2));
    location = l.get();
    lifespan = 255.0;
    colourR = random(255);                                            //randomization of coulors
    colourG = random(255);
    colourB = random(255);
  }

  // Sometimes it’s convenient to have a “run”
  // function that calls all the other functions we need.
  void run() {
    update();
    display();
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 2.0;
  }

  void display() {
    stroke(0, lifespan);
    fill(colourR, colourG, colourB, lifespan); 
    ellipse(location.x, location.y, 8, 8);
  }

  // Is the Particle alive or dead?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
