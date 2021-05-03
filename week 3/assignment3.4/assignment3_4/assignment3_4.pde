// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

void setup() {
  size(640, 360);
  background(255);
}

void draw() {

  // Get a gaussian random number w/ mean of 0 and standard deviation of 1.0
  float xloc = randomGaussian();
  float yloc = randomGaussian();
  float ass  = randomGaussian();

  float sd = 60;                // Define a standard deviation
  float nsd = 20;
  float mean = width/2;         // Define a mean value (middle of the screen along the x-axis)
  float boobies = height/2;
  xloc = ( xloc * sd ) + mean;  // Scale the gaussian random number by standard deviation and mean
  yloc = ( yloc * sd ) + boobies;  // Scale the gaussian random number by standard deviation and boobies
  ass  = ( ass *  nsd ) + random(0,20);

  fill(255, 251, 0, 69);
  noStroke();
  ellipse(xloc, yloc, ass, ass);   // Draw an ellipse at our "normal" random position
}
