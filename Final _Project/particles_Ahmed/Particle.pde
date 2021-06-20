/*This class contains everything that has to do with object
 Particle with all their methods
 */

class Particle {
  // The Mover tracks location, velocity, and acceleration 
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector gravity; 
  PVector friction;
  float lifetime = int(random(100, 255));
  boolean isDead;

  Particle(PVector loc) { //vectors that make for real-like physics
    location = new PVector(loc.x, loc.y);
    velocity = new PVector(random(-20, 20), random(-20, 20));
    gravity = new PVector(0, 0.3);
    friction = new PVector(0, 0);
  }


  void display() {
    noStroke();
    fill(0, lifetime * 0.5);
    ellipse(location.x, location.y, 15, 15);
  }


  void update() { //values for the vectors
    location.add(velocity);
    velocity.normalize(friction);
    friction.setMag(.08);
    velocity.add (gravity);
    velocity.sub(friction);
    lifetime = lifetime - 0.5;
  }


  boolean isDead() { //when the particles are transparant enough, return
    return lifetime < 50;
  }
}
