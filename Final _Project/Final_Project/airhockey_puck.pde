class Puck {

  PVector location, acceleration, velocity;
  PVector mouse, launchLocation;

  int puckState;
  color puckColor;

  Puck() {
    location = new PVector(width/2, height/2);
    launchLocation = new PVector(width/2, height/2);
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);

    puckState = 0;
    puckColor = color(250, 200, 100);
  }

  void run() {
    //puck when starting off (before puckState 2)
    if (puckState == 0) {                                                           //puck state zero indicates the puck is in its standard position in the centre of the screen ready to launch
      location.set(launchLocation);
    } else if (puckState == 1) {                                                    //puck state one indicates that the puck will follow the mouse untill the mouse button is released
      location.set(mouse.x, mouse.y);
    }

    //physics part of the puck    
    location.add(acceleration);                                                         //acceleration is added to the current location of the puck
    acceleration.mult(.99);                                                             //then you have a small amount of friction

    // look of the puck
    fill (puckColor);
    circle(location.x, location.y, 50);
  }

  void reset() {
    puckState = 0;
  }

  void mouseDraggedEvent(PVector mouseLocation) {                                                               //when the puck is being dragged the puck is in state one
    if (puckState == 0 || puckState == 1) {                                                                     //only works when the puckstate is not 2 to stop the mouse from interfering when playing the game (aka puckState 2)
      puckState = 1;
      mouse = mouseLocation;                                                                                    //the location of the mouse is passed through to "mouse"
      acceleration.set(- 0.2 * (mouse.x - launchLocation.x), - 0.2 * (mouse.y - launchLocation.y));             //the velocity gets calculated and reversed, ready for launch
    }
  }

  void mouseReleasedEvent() {                                                           //if puck is released then release is obviously true
    puckState = 2;                                                                      //in this state the puck cannot be changed by the mouse anymore
  }
}
