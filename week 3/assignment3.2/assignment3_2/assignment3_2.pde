/* This program has been written by Jasper Bosschart (s2562685) & Marina Stefanova (s2610604), assignment 3.2 from module 4 CreaTe 2021 */

Ball ball;
Catapult catapult;
PVector cataLocation;

void setup() {
  size(1000, 750);
  cataLocation = new PVector(150, 430);
    ball = new Ball();                                                              // a ball gets a position initially
  catapult = new Catapult(cataLocation, ball);                                      // a catapult has a position and a ball it shoots
}

void draw() {

  // background
  background(110, 180, 250);
  fill (60, 80, 50);
  noStroke();
  rect(0, height-100, 1000, 100);

  // ball&catapult
  catapult.update();                                                               //to update all the handelings of the catapult
  ball.update();                                                                   //to update all the handelings of the ball
  catapult.renderBack();                                                           //backside of the catapult
  ball.render();                                                                   //drawing the ball
  catapult.renderFront();                                                          //frontside of the catapult, to create an ellusion of the ball passing through
}

void mouseDragged() {                                                              //dragging the ball in the catapult
  catapult.mouseDraggedEvent(new PVector(mouseX, mouseY));
}

void mouseReleased() {                                                             // releasing the ball from the catapult
  catapult.mouseReleasedEvent();
}
