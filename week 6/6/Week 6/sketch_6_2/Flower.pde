class Flower {
  PVector location;
  PVector origin; 
  float plantLength;
  float angle;
  float x, y; //initial translation
  float parts = 10;
  float bowing=1.005;
  Segment[] segments= new Segment[10];

  Flower(float X, float Y) {
    origin = new PVector(0, 0);
    location = new PVector(0, 0); 
    y = Y;
    x = X;
    angle = bowing*PI; //angle, whill will decide how much the plant bows
    plantLength = 200/parts;
    for (int i = 0; i<segments.length; i++) {
      segments[i] = new Segment();
    }
  }

  void update(){} 

  void display() {
    pushMatrix();
    translate(x, y);
    //location.add(origin);
    location.set(plantLength*sin(angle), plantLength*cos(angle), 0);
    // strokeWeight(1);
    for (int i=0; i < parts; i++) {
      stroke(51, 100, 0);
      strokeWeight(5);
      line(origin.x, origin.y, location.x, location.y);       
      translate(location.x, location.y);
      rotate(angle+PI);
    }
    fill(255,10,0);
    stroke(255,100,0);
    circle(location.x,location.y,20);
    popMatrix();
  }
}
