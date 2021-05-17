/* This is the ball class for the catapult game, in here the physics of the ball are described, after it has been launched by the catapult*/
class Ball {

  PVector location, velocity, gravity, friction;
  boolean release;

  Ball() {
    location = new PVector(0, 0); //some different vectors that have been used in the code are initiated here.
    velocity = new PVector(20, 0);
    gravity = new PVector(0, .4);
    release = false;
  }

  void update() {
    if (release) { // if the ball is released all the physics come in to play making the ball drop in a "real life" way
      location.add(velocity); //velocity is added to the current location of the ball
      velocity.add(gravity); //the velocity changes over time because of added gravity
      velocity.mult(.99); //then you have a small amount of friction
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
