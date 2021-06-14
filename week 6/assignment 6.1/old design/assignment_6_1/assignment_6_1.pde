/* This program has been written by Jasper Bosschart (s2562685) & Marina Stefanova (s2610604), assignment 6 from module 4 CreaTe 2021 */


Flower flower;

void setup() {
  size(640, 640);
  flower = new Flower();
}

void draw() {
  background(120, 180, 255);
  flower.update();
  flower.render();
}
