class Flower {

  // Mover object
  Bob bob;

  // Spring object
  Spring spring;

  PVector location;

  Flower(PVector l, int restLength) {
    location = l.get();                                                                  //location from the main class

    // Create objects at location
    spring = new Spring(location.x, location.y+restLength, restLength);                                 // Note third argument is "rest length"
    bob = new Bob(location.x, location.y);
  }

  void run (PVector mouse) {
    update(mouse);
    display();
  }

  void update (PVector mouse) {
    //// Apply a gravity force to the bob
    //PVector gravity = new PVector(0, 2);
    //bob.applyForce(gravity);

    // Connect the bob to the spring (this calculates the force)
    spring.connect(bob);
    // Constrain spring distance between min and max
//    spring.constrainLength(bob, 30, 200);

    // Update bob
    bob.update();
    // If it's being dragged
    bob.drag(mouse);
  }

  void display () {
    // Draw everything
    spring.displayLine(bob);                                               // Draw a line between spring and bob
    bob.display(); 
    spring.display();
  }

  // For mouse interaction with bob
  void clickEvent(PVector mouse) {
    bob.clicked(mouse);
  }
  void releaseEvent() {
    bob.stopDragging();
  }
}
