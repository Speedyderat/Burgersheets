/* This program has been written by Jasper Bosschart (s2562685) & Marina Stefanova (s2610604), assignment 3 from module 4 CreaTe 2021 */

PVector ballloc;  // location of shape
PVector velocity;  // Velocity of shape
PVector gravity;   // Gravity acts at the shape's acceleration

void setup() {
  size(640, 360);
  ballloc = new PVector(100, 100);
  
  velocity = new PVector(1.5, 2.1);
  gravity = new PVector(0, 0.3);
}

void draw() {
  background(0);

  velocity.x = velocity.x * gravity.x;

  // Add velocity to the ballloc.
  ballloc.add(velocity);
  // Add gravity to velocity
  velocity.add(gravity);

  // Bounce off edges
  if ((ballloc.x > width) || (ballloc.x < 0)) {
    velocity.x = velocity.x * -1;
  }
  if (ballloc.y > height) {
    // We're reducing velocity ever so slightly 
    // when it hits the bottom of the window
    velocity.y = velocity.y * -0.95; 
    ballloc.y = height;
  }

  // Display circle at ballloc vector
  stroke(255);
  strokeWeight(2);
  fill(127);
  ellipse(ballloc.x, ballloc.y, 48, 48);
}
