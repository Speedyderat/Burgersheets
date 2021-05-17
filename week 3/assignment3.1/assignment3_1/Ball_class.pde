class Ball {

  PVector location, velocity, gravity, friction;
  boolean release;

  Ball(PVector location) {
    this.location = location;
    velocity = new PVector(20, 0);
    gravity = new PVector(0, .4);
    release = false;
  }

  void update() {
    if (release) {
      location.add(velocity);
      velocity.add(gravity);
      velocity.mult(.99);
      if ((location.x > width) || (location.x< 0)) {
        velocity.x = -velocity.x * .8;
        if (location.x > width) {
          location.x = width;
        }  else if (location.x< 0) {
          location.x = 0;
        }
      }
      if (location.y > height) {
        if (velocity.y < 2) {
          velocity.y = 0;
          velocity.x = 0;
        }
        if (velocity.y > 2) {
          velocity.y = -velocity.y *.6;
          location.y = height;
        }
      }
    }
  }

  void render() {
    stroke(255);
    strokeWeight(2);
    fill(255, 50, 50);
    ellipse(location.x, location.y, 30, 30);
  }

  void release() {
    release = true;
  }
}
