/* This program has been written by Jasper Bosschart (s2562685) & Marina Stefanova (s2610604), assignment 5 from module 4 CreaTe 2021 */
// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Demonstration of Craig Reynolds' "Flocking" behavior
// See: http://www.red3d.com/cwr/
// Rules: Cohesion, Separation, Alignment

// Click mouse to add boids into the system

Flock flock;
Obstacle obstacle;

void setup() {
  size(1000, 750);
  flock = new Flock();  // Add an initial set of boids into the system
  for (int i = 0; i < 50; i++) {
    Boid b = new Boid(width/2, height/2);
    flock.addBoid(b);
  }
  obstacle = new Obstacle();
}

void draw() {
  background(255);
  flock.run();
  obstacle.display();

  // Instructions
  fill(0);
  text("Drag the mouse to generate new boids.", 10, height-16);
}

// Add a new boid into the System
void mouseDragged() {
  flock.addBoid(new Boid(mouseX, mouseY));
}
