class Penis
{

  //PENIS variables
  float widthTesticle, heightTesticle;
  float timesFactor;
  //MASS-SPRING DAMPER variables
  float angle, position, torque, friction, mass, acceleration, velocity, constant;

  Penis()
  {
    widthTesticle = 40;
    heightTesticle = 42;
    mass = 0.016;
    acceleration = 0.030;
    constant = 70;
    timesFactor = 0.75;
  }

  void update()
  {
    //VELOCITY updated by acceleration
    velocity += acceleration;
    //POSITION updated by velocity
    position += velocity;
    //TORQUE = 1/c ∫ω dt, where c = 100
    torque = 1/constant * position;
    //FRICTION = f * ω, where f = 0.05
    friction = 0.05 * velocity;     
    //ACCELERATION = -(T+F+m) (Law of d’ Alembert)
    acceleration = -(torque + friction + mass); 

    //ANGLE
    angle = 0.8*HALF_PI + position +(mass*constant);
  }

  void render()
  {
    pushMatrix();
    translate(width/4, height/2);
    rotate(angle);
    //Testicles
    
    //Body
    stroke(51, 100, 0);
    strokeWeight(10);
    line(0, 0, 100, 100);
    endShape();
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
