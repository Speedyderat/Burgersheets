class Flower {
  PVector location;
  PVector origin; 

  float plantLength, angle, velocity, acceleration, damping; 
  float parts; //Plant is divided in subparts
  float x, y; //initial translation
  float bowing=1.005;
  float timesFactor;
  
  Flower (float X, float Y) { //misschien extra constructordingetje voor begin hoek?
    //constructor for variables used in this class
    //initial values, will get changed in update
    origin = new PVector(0, 0);
    location = new PVector(0, 0); 
    angle = bowing*PI; //angle, whill will decide how much the plant bows
    damping = 1; //damping speed
    y = Y;
    x = X;
    parts = 10; //smoothness
    plantLength = 200/parts; 
    timesFactor = 0.75;
  }

  void update() {
    float friction = 0.01; //determines speed of plant moving
    acceleration = (friction / plantLength) * sin(angle); //formulas for MSD systems
    velocity += acceleration;
    angle += velocity;
    velocity *= damping;
  }

  // drawing of the flowerhead
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
    //the face, i removed it cuz it looked like it was acting weird cuz of the movements
    //arc(0, 15, 40*timesFactor, 25*timesFactor, QUARTER_PI, PI, OPEN);
    //fill(0);
    // ellipse(15*timesFactor, -15*timesFactor, 15*timesFactor, 15*timesFactor);
    // ellipse(-15*timesFactor, -15*timesFactor, 15*timesFactor, 15*timesFactor);
    // line(10*timesFactor, 0, 0, 0);
  }


  void display() {
    pushMatrix();
    translate(x, y);
    //location.add(origin);
    location.set(plantLength*sin(angle), plantLength*cos(angle), 0);
    // strokeWeight(1);
    for (int i=0; i < parts; i++) {
      stroke(51, 100, 0);
      strokeWeight(10);
      line(origin.x, origin.y, location.x, location.y);       
      translate(location.x, location.y);
      rotate(angle+PI);
    }
    for (int i = 0; i < 9; i++) {        //this creates 9 petals for the flower
      petal();
      rotate(0.7);
    }
    flowerMiddle();
    popMatrix();
  }
}
