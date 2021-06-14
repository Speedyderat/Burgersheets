/* This program has been written by Jasper Bosschart (s2562685) & Marina Stefanova (s2610604), assignment 6.2 from module 4 CreaTe 2021 */

Flower[] flowers = new Flower[3];

void setup() {
  size(800, 800);
  for (int i = 0; i<flowers.length; i++) {
    flowers[i] = new Flower(i*150+width/2-150, height);
  }
}

void draw() { 
  background(255);

  for (int i = 0; i<flowers.length; i++) {
    flowers[i].update();
    flowers[i].display();
  }
}
