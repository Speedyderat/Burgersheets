// Physics inspired by:
// Daniel Shiffman's Nature Of Code
// https://natureofcode.com/book/chapter-3-oscillation/
// Greg Lewin's Mass-spring-damper Tutorial
// https://youtu.be/_SYfzEGL7xA

class Flower
{
  //MSD variables
  float angle, position, torque, friction, mass, acceleration, velocity, constant;
  //flower variables
  float timesFactor;

  Flower()
  {
    mass = 0.01;
    acceleration = 0.05;
    constant = 70;
    timesFactor = 0.75;
  }

  void update()
  {
    velocity += acceleration;
    position += velocity;
    //torque
    torque = 1/constant * position;
    //friction
    friction = 0.05 * velocity;     
    //acceleration 
    acceleration = -(torque + friction + mass); 

    //ANGLE
    angle = -1.5*HALF_PI + position +(mass*constant);
  }

  void display()
  {
    pushMatrix();
    translate(width/2, height-5);
    rotate(angle);
    
    //Flower body
    stroke(51, 100, 0);
    strokeWeight(10);
    line(0, 0, 100, 100);
    translate(100, 100);
    for (int i = 0; i < 9; i++) {                                                                      //This creates 9 petals for the flower
      petal();
      rotate(0.7);
    }
    flowerMiddle();
    popMatrix();
  }

  // drawing of the flowerhead
  void petal() {                                                                                       //This will create a petal
    strokeWeight(2);
    stroke(0);
    fill (random(255), random(255), random(255));
    triangle (0, 0, 26.1*timesFactor, 74*timesFactor+3*timesFactor, -26.1*timesFactor, 74*timesFactor+3*timesFactor);
    arc (0, 75*timesFactor, 52*timesFactor, 52*timesFactor, 0, PI, OPEN);
  }

  void flowerMiddle() {                                                                               //This is the middle of the flower
    strokeWeight(2);
    stroke(0);
    fill(255, 255, 0);
    ellipse(0, 0, 100*timesFactor, 100*timesFactor);
    noFill();
  }
}
