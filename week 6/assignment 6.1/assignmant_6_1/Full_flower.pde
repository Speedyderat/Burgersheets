class Flower {

  // Mover object
  Bob bob;

  // Spring object
  Spring spring;

  Flower() {
    // Create objects at starting location
    spring = new Spring(width/2, 200, 200);                                 // Note third argument is "rest length"
    bob = new Bob(width/2, 150);
  }

  void run (PVector mouse) {
    update(mouse);
    display();
  }

  void update (PVector mouse) {
    // Apply a gravity force to the bob
    PVector gravity = new PVector(0, 2);
    bob.applyForce(gravity);

    // Connect the bob to the spring (this calculates the force)
    spring.connect(bob);
    // Constrain spring distance between min and max
    spring.constrainLength(bob, 30, 400);

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

  void clickEvent(PVector mouse) {
    bob.clicked(mouse);
  }
  void releaseEvent() {
    bob.stopDragging();
  }
}
