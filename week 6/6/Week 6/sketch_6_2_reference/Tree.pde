class Tree {
  PVector location;
  PVector origin; 
  float plantLength;
  float angle;
  float velocity;
  float acceleration;
  float damping; 
  float parts; //Plant is divided in subparts
  float x, y; //initial translation
  float bowing=1.005;
 
  Tree(float X, float Y) { //misschien extra constructordingetje voor begin hoek?
    //constructor for variables used in this class
    //initial values, will get changed in update
    origin = new PVector(0,0);
    location = new PVector(0,0); 
    angle = bowing*PI; //angle, whill will decide how much the plant bows
    damping = 1; //damping speed
    y = Y;
    x = X;
    parts = 10; //smoothness
    plantLength = 200/parts; 
  }
 
  void update() {
    float friction = 0.01; //determines speed of plant moving
    acceleration = (friction / plantLength) * sin(angle); //formulas for MSD systems
    velocity += acceleration;
    angle += velocity;
    velocity *= damping; 
  }
 
  void display() {
    pushMatrix();
    translate(x, y);
    //location.add(origin);
    location.set(plantLength*sin(angle), plantLength*cos(angle), 0);
   // strokeWeight(1);
    for (int i=0; i < parts; i++) {
      stroke(51,100,0);
      strokeWeight(10);
      line(origin.x, origin.y, location.x, location.y);       
      translate(location.x, location.y);
      rotate(angle+PI);
    }
    popMatrix();
  }
 
}
