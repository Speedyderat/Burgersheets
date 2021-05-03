/* This program has been written by Jasper Bosschart (s2562685) & Marina Stefanova (s2610604), assignment 2.1 from module 4 CreaTe 2021 */
// Graphing 1D Perlin Noise (1D Noise Graph)
// The Coding Train / Daniel Shiffman
// https://thecodingtrain.com/learning/noise/0.4-graphing-1d.html
// https://youtu.be/y7sgcFhk6ZM

float xoff = 0;
float xincrement = 0.01; 
float start = 0;
PImage car;

void setup() {
  size(500, 500);
  background(0);
  car = loadImage("image/Car.png");
}

void draw() {

  background(51);
  car.resize(0, 100);
  imageMode(CENTER);
  stroke(0);
  fill(200);

  beginShape();
  vertex(0, height);
  float xoff = start;

  for (float x = 0; x < width; x++) {
    stroke(255);
    // let y = random(height);
    float y = map(noise(xoff) * height, 0, height, 200, 350);
    vertex(x, y);
    xoff += xincrement;
  }

  vertex(width, height);
  endShape();

  start += xincrement;
  fill(150);
  rect(0, 400, width, height);

    image(car, width/2, 425);
}
