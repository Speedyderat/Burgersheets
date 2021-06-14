/* This is the catapult class, in here the catapult is described and how it interacts with the ball */

class Catapult {

  Ball ball;
  PVector location, mouse, catapultMiddle;
  int ballState = 0;
  PImage catapultBase, catapultLeft, catapultRight;

  Catapult(PVector location, Ball ball) {
    this.ball = ball;                                                               //the ball is the same ball created in the ball class
    this.location = location;                                                       //location of the catapult is defined in the main code and gets passed through

    mouse = new PVector(0, 0);                                                      //vector for the mouse gets defined here
    catapultMiddle = new PVector (location.x+25, location.y - 65);                  // middle of the catapult where the ball is stationed when not moving, also the point from which the launch gets calculated

    catapultBase = loadImage("image/catapultbase.png");                             // different parts of the catapult to create depth
    catapultLeft = loadImage("image/catapultleft.png");
    catapultRight = loadImage("image/catapultright.png");
  }

  //looks of the catapult, devided into two because of depth
  void renderBack() {                                                               //backside of the catapult, the ball will be infront
    catapultLeft.resize(0, 70);
    image(catapultLeft, location.x-8, location.y-65);
  }
  void renderFront() {                                                             //frontside of the catapult, the ball will be behind it
    catapultRight.resize(0, 70);
    image(catapultRight, location.x, location.y-65);
    catapultBase.resize(0, 100);
    image(catapultBase, location.x, location.y);
  }

  //ball inside of the catapult physics
  void update() {
    if (ballState == 0) {                                                           //ball state zero indicates the ball is in its standard position in the catapult
      ball.location.set(catapultMiddle);
    } else if (ballState == 1) {                                                    //ball state one indicates that the ball will follow the mouse untill the mouse button is released
      ball.location.set(mouse.x, mouse.y);
    }
  }

  void mouseDraggedEvent(PVector mouseLocation) {                                 //when the ball is being dragged the ball is in state one
    ballState = 1;
    mouse = mouseLocation;                                                        //the location of the mouse is passed through to "mouse"
    ball.velocity.set(- 0.2 * (mouse.x - catapultMiddle.x), - 0.2 * (mouse.y - catapultMiddle.y));             //the velocity gets calculated and reversed, ready for launch
  }

  void mouseReleasedEvent() {                                                     //if ball is released then release is obviously true
    ballState = 2;                                                                //in this state the ball cannot be changed by any other factors then the physics of the ball
    ball.release();
  }
}
