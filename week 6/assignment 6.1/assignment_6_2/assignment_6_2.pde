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
