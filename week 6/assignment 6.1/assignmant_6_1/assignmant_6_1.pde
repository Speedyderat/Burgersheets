/* This program has been written by Jasper Bosschart (s2562685) & Marina Stefanova (s2610604), assignment 6 from module 4 CreaTe 2021 */
// Nature of Code 2011
// Daniel Shiffman
// Chapter 3: Oscillation
// Mover attached to spring connection
// PVector
// http://www.shiffman.net

// Spring object
Flower flower;

void setup() {
  size(800, 500);
  smooth();
  flower = new Flower();
}

void draw() {
  background(255); 
  flower.run(new PVector(mouseX, mouseY));
}


// For mouse interaction with bob

void mousePressed() {
  flower.clickEvent(new PVector(mouseX, mouseY));
}

void mouseReleased() {
  flower.releaseEvent();
}
