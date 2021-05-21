class Particle { //A “Particle” object is just another name for our “Mover.” It has location, velocity, and acceleration.
  PVector location;
  PVector velocity;
  PVector acceleration;
 
  Particle(PVector l) {
    location = l.get();
    acceleration = new PVector();
    velocity = new PVector();
  }
 
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
  }
 
  void display() {
    stroke(0);
    fill(175);
    ellipse(location.x,location.y,8,8);
  }
}
