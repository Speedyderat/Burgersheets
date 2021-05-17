class Catapult {

  PVector location, mouse, catapultMiddle;
  Ball ball;
  int ballState = 0;
  boolean springRelease, shooting;
  PImage catapultBase, catapultLeft, catapultRight;

  Catapult(PVector location, Ball ball) {
    this.location = location;
    this.ball = ball;
    mouse = new PVector(0, 0);
    catapultMiddle = new PVector (location.x+25, location.y - 65);
    springRelease = false;
    shooting = false;
    catapultBase = loadImage("image/catapultbase.png");
    catapultLeft = loadImage("image/catapultleft.png");
    catapultRight = loadImage("image/catapultright.png");
  }

  void update() {
    if (ballState == 0) {
      ball.location.set(catapultMiddle);
    } else if (ballState == 1) {
      ball.location.set(mouse.x, mouse.y);
    }
  }

  void renderBack() {
    catapultLeft.resize(0, 70);
    image(catapultLeft, location.x-8, location.y-65);
    catapultBase.resize(0, 100);
    image(catapultBase, location.x, location.y);
  }
  void renderFront() {
    catapultRight.resize(0, 70);
    image(catapultRight, location.x, location.y-65);
    catapultBase.resize(0, 100);
    image(catapultBase, location.x, location.y);
  }

  void mouseDraggedEvent(PVector mouseLocation) {
    ballState = 1;
    mouse = mouseLocation;
    shooting = true;
    ball.velocity.set(
      - 0.2 * (mouse.x - catapultMiddle.x), 
      - 0.2 * (mouse.y - catapultMiddle.y)
      );
  }

  void mouseReleasedEvent() {
    ballState = 2;
    ball.release();
  }
}
