class Game {

  Ball ball;
  Catapult catapult;
  Wall wall;
  PVector cataLocation;

  Game() {
    cataLocation = new PVector(150, 430);
    ball = new Ball();                                                              // a ball gets a position initially
    catapult = new Catapult(cataLocation, ball);                                      // a catapult has a position and a ball it shoots
    wall = new Wall(ball);
  }

  void display() {

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

    //wall and borders
    wall.update();
    wall.display();
  }

  void mouseDraggedEvent(PVector mouse) {                                                  //dragging the ball in the catapult
    catapult.mouseDraggedEvent(mouse);
  }

  void mouseReleasedEvent() {                                                             // releasing the ball from the catapult
    catapult.mouseReleasedEvent();
  }
}
