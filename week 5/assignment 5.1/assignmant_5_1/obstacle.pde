class Obstacle {

  PVector location;
  float radiusObstacle;

  Obstacle() {
    location = new PVector(random(100, width-100), random(100, height-100));
    radiusObstacle = random(50, 200);
  }

  void display() {
    pushMatrix();
    translate(location.x, location.y);
    circle(0, 0, radiusObstacle);
    popMatrix();
  }

  void update() {
  }}
