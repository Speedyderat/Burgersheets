/* class for every single particle in the particle system, giving them color and movement */
class Particle {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan, colourR, colourG, colourB;

  Particle(PVector l) {
    acceleration = new PVector(0, random(-0.05, 0.05));               //The particles have an random acceleration going up or down 
    velocity = new PVector(random(-1, 1), random(-2, 0));             //The particles have an random velocity
    location = l.copy();                                              //The particles start around a particular location (the top of the wand)
    lifespan = 255.0;                                                 //lifespan of the particles
    colourR = random(255);                                            //randomization of coulors
    colourG = random(255);
    colourB = random(255);
  }

  void run() {                                                        //run function calls the other functions in this class
    update();
    display();
  }

  void update() {                                                    //update function to make the particles move how they move
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 2.0;                                                 //slowly fades out the particle over time
  }

  void display() {
    stroke(0, lifespan);                                             //slowly fades out the particle over time
    fill(colourR, colourG, colourB, lifespan);                       //random colours for every particle and a lifespan
    ellipse(location.x, location.y, 8, 8);
  }

  boolean isDead() {                                                 // Is the Particle alive or dead?
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
