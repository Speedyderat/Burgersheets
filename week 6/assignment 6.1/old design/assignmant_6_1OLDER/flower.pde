// Nature of Code 2011
// Daniel Shiffman
// Chapter 3: Oscillation

// Bob class, just like our regular Mover (location, velocity, acceleration, mass)

class Bob { 
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector windForce;
  float mass = 24, timesFactor;

  // Arbitrary damping to simulate friction / drag 
  float damping = 0.98;

  // For mouse interaction
  PVector mouseOffset;
  boolean dragging = false;

  // Constructor
  Bob(float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector();
    acceleration = new PVector();
    mouseOffset = new PVector();
    timesFactor = 0.25;
  } 

  // Standard Euler integration
  void update() { 
    velocity.add(acceleration);
    velocity.mult(damping);
    location.add(velocity);
    acceleration.mult(0);
  }

  // Newton's law: F = M * A
  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);
  }

  void petal() {                                                                                                            //this will create a petal
    strokeWeight(2);
    stroke(0);
    fill (random(255), random(255), random(255));
    triangle (0, 0, 26.1*timesFactor, 74*timesFactor+3*timesFactor, -26.1*timesFactor, 74*timesFactor+3*timesFactor);
    arc (0, 75*timesFactor, 52*timesFactor, 52*timesFactor, 0, PI, OPEN);
  }

  void flowerMiddle() {                                                                                                    //this is the middle of the flower which is yellow with a smile
    strokeWeight(2);
    stroke(0);
    fill(255, 255, 0);
    ellipse(0, 0, 100*timesFactor, 100*timesFactor);
    noFill();
    arc(0, 15, 40*timesFactor, 25*timesFactor, QUARTER_PI, PI, OPEN);
    fill(0);
    ellipse(15*timesFactor, -15*timesFactor, 15*timesFactor, 15*timesFactor);
    ellipse(-15*timesFactor, -15*timesFactor, 15*timesFactor, 15*timesFactor);
    line(10*timesFactor, 0, 0, 0);
  }

  // Draw the bob
  void display() {
    pushMatrix();
    translate(location.x, location.y);                                                                                           //this is to translate all the parts of the flower exept the stem to their given position
    for (int i = 0; i < 9; i++) {                                                                                                //this creates 9 petals for the flower
      petal();
      rotate(0.7);
    }
    flowerMiddle();
    popMatrix();
  }

  // The methods below are for mouse interaction

  // This checks to see if we clicked on the mover
  void clicked(PVector m) {
    float d = dist(m.x, m.y, location.x, location.y);
    mouseOffset.y = location.y-m.y;
    mouseOffset.x = location.x-m.x;
    if (d < mass) {
      dragging = true;
    } else {
      //windForce = new PVector(mouseOffset.x, mouseOffset.y);
    }
  }

  void stopDragging() {
    dragging = false;
  }

  void drag(PVector m) {
    if (dragging) {
      location.y = m.y + mouseOffset.y;
      location.x = m.x + mouseOffset.x;
    }
  }
}
