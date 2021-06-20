// The following glass introduces the particle. It makes a particle and adds physical qualities to it in order to act like selebratory confeti. 

class Particle {
  PVector location;
  PVector velocity;
  PVector gravity; 
  float lifespan, colourR, colourG, colourB;

  Particle(PVector loc) {                                             //vectors that make realistic physics
    location = new PVector(loc.x, loc.y);
    velocity = new PVector(random(-20, 20), random(-20, 20));
    gravity = new PVector(0, 0.3);
    lifespan =  int(random(100, 255));

    colourR = random(255);                                            //randomization of colors
    colourG = random(255);
    colourB = random(255);
  }

  void display() {                                                   //drawing the particle
    noStroke();
    fill(colourR, colourG, colourB, lifespan * 0.5);
    ellipse(location.x, location.y, 15, 15);
  }

  void update() {                                                    //values for the vectors
    location.add(velocity);
    velocity.add (gravity);
    lifespan = lifespan - 0.5;
  }

  boolean isDead() {                                                //checks if the particles are transparent enough, and then returns 
    return lifespan < 50;
  }
}
