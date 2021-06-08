class Flower {
  int numberSegments=10;
  float angleFlower;
  PVector origin;
  float segmentLength;
  float offset = 0.1;
  Segment [] segments = new Segment[numberSegments];

  Flower(PVector place) {
    for (int i = 0; i<segments.length; i++) {
      segments[i] = new Segment(map(noise(0.1*i),0,1,0.1,0.5));
    }
    angleFlower = PI/100;
    origin = place;
    segmentLength = -25;
  }

  void update() {
    for (int i=0; i<numberSegments; i++) {
      if (i==0) {
        segments[i].update(0, segments[i+1].force);
      } else if (i == numberSegments-1) {
        segments[i].update(segments[i-1].velocity, 0);
      } else {
        segments[i].update(segments[i-1].velocity, segments[i+1].force);
      }
    }
  }

  void updateWind(){
      segments[9].wind(map(noise(0.1*offset),0,1,0,0.3));
      offset++;
  }
  
  void display() {
    strokeWeight(10);
    stroke(75,180,98);
    pushMatrix();
    translate(origin.x, origin.y);
    for (int i=0; i<numberSegments; i++) {
      rotate(segments[i].angle);
      line(0, 0, 0, segmentLength);
      translate(0, segmentLength);
    }
    stroke(202,26,142);
    fill(252,201,14);
    circle(0,0,50);
    popMatrix();
  }
}
