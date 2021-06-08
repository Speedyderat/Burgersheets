class Flower {
  int numberSegments=1;
  float angleFlower;
  float segmentLength;
  float offset = 0.1;
  Segment henk;
  Bloem bloem;

  Flower(PVector place) {
    origin = place;
    segmentLength = -300;
    bloem = new Bloem();
    henk = new Segment(5);
  }

  void update() {
    henk.update();
  }

void display() {
  strokeWeight(10);
  stroke(75, 180, 98);
  pushMatrix();
  translate(origin.x, origin.y);
  for (int i=0; i<numberSegments; i++) {
    rotate(henk.angle);
    line(0, 0, 0, segmentLength);
    translate(0, segmentLength);
  }
  bloem.display();
  popMatrix();
}
}
