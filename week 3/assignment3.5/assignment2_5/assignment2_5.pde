/* This program has been modified by Jasper Bosschart (s2562685) & Marina Stefanova (s2610604), assignment 2.1 from module 4 CreaTe 2021 */
// Daniel Shiffman
// The Nature of Code
// http://natureofcode.com

float xoff = 0.0;
float xincrement = 0.03; 
float yoff = 0.0;
float yincrement = 0.01; 

void setup() {
  size(200,200);
  background(0);
  noStroke();
}

void draw() {
  // Create an alpha blended background
  fill(0, 10);
  rect(0,0,width,height);
  
  // Get a noise value based on xoff and scale it according to the window's width
  float n = noise(xoff)*width;
  
    // Get a noise value based on xoff and scale it according to the window's width
  float p = noise(yoff)*height;
  
  // With each cycle, increment xoff
  xoff += xincrement;
  
    // With each cycle, increment yoff
  yoff += yincrement;
  
  // Draw the ellipse at the value produced by perlin noise
  fill(200);
  ellipse(n,p,16,16);
}
