class Poly {
  float x, y;
  ArrayList points;
  Poly(float _x, float _y, ArrayList p) {
    x = _x;
    y = _y;
    points = p;
  }
  void show() {
    pushMatrix();
    fill(150);
    stroke(0);
    beginShape();
    translate(x, y);
    for ( int i = 0; i < points.size(); i++ ) {
      PVector v = (PVector)points.get(i);
      vertex( v.x, v.y );
    }
    endShape(CLOSE);
    popMatrix();
  }
}
