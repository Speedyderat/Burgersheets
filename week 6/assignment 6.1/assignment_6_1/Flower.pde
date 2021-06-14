class Flower {

  PVector location;
  PVector origin; 

  float plantLength, angle, velocity, acceleration, damping, friction, bowing;                          //Variables for the movement
  float parts;                                                                                          //Plant is divided in subparts
  float x, y;                                                                                           //Initial translation
  float timesFactor;
  float cR, cG, cB;

  Flower (float x, float y) {                                                                           //Constructor for variables used in this class
    this.y = y;
    this.x = x;
    origin = new PVector(0, 0);
    location = new PVector(0, 0); 

    friction = 0.5;                                                                                     //Determines speed of plant moving
    damping = 0.999;                                                                                     //Damping speed
    bowing = 1.050;
    angle = bowing*PI;                                                                                  //Angle, whill will decide how much the plant bows
    parts = 1;                                                                                         //how many parts the stem has
    plantLength = 200/parts;                                                                            //how long the stem is
    timesFactor = 0.75;                                                                                 //sizing of the flowerhead
    cR = random(255);
    cG = random(255);
    cB = random(255);
  }

  void update() {
    acceleration = (friction / plantLength) * sin(angle);                                               //Formulas for MSD systems (?)
    velocity += acceleration;
    angle += velocity;
    velocity *= damping;
  }

  // drawing of the flowerhead

  void petal() {                                                                                       //This will create a petal
    strokeWeight(2);
    stroke(0);
    fill (cR, cG, cB);
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


  void display() {
    pushMatrix();
    translate(x, y);
    location.set(plantLength*sin(angle), plantLength*cos(angle), 0);

    for (int i=0; i < parts; i++) {
      stroke(51, 100, 0);
      strokeWeight(10);
      line(origin.x, origin.y, location.x, location.y);       
      translate(location.x, location.y);
      rotate(angle+PI);
    }

    for (int i = 0; i < 9; i++) {                                                                      //This creates 9 petals for the flower
      petal();
      rotate(0.7);
    }

    flowerMiddle();
    popMatrix();
  }
}
