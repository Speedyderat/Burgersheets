class Puck {

  PVector location, acceleration, velocity;
  PVector mouse, launchLocation;

  int puckState;
  color puckColor;

  Puck() {
    location = new PVector(width/2, height/2);
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);

    puckState = 0;
    puckColor = color(250, 200, 100);
  }

  void physics() {
    location.add(acceleration);                                                         //acceleration is added to the current location of the ball
    acceleration.add(velocity);                                                         //the acceleration changes over time because of added velocity
    acceleration.mult(.99);                                                             //then you have a small amount of friction
  }

  void display() {
    fill (puckColor);
    circle(location.x, location.y, 50);
  }


  //puck when starting off
  void launchStart() {
    if (puckState == 0) {                                                           //ball state zero indicates the ball is in its standard position in the catapult
      location.set(launchLocation);
    } else if (puckState == 1) {                                                    //ball state one indicates that the ball will follow the mouse untill the mouse button is released
      location.set(mouse.x, mouse.y);
    }
  }

  void mouseDraggedEvent(PVector mouseLocation) {                                                         //when the ball is being dragged the ball is in state one
    puckState = 1;
    mouse = mouseLocation;                                                                                //the location of the mouse is passed through to "mouse"
    velocity.set(- 0.2 * (mouse.x - launchLocation.x), - 0.2 * (mouse.y - launchLocation.y));             //the velocity gets calculated and reversed, ready for launch
  }

  void mouseReleasedEvent() {                                                           //if ball is released then release is obviously true
    puckState = 2;                                                                      //in this state the ball cannot be changed by any other factors then the physics of the ball
  }
}
