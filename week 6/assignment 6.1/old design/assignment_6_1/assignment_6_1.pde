/* This program has been written by Jasper Bosschart (s2562685) & Marina Stefanova (s2610604), assignment 6 from module 4 CreaTe 2021 */

Flower flower;

void setup() {
  size(600, 600);
  flower = new Flower();
}

void draw() {
  background(140, 170, 250);
  flower.update();
  flower.display();
}
