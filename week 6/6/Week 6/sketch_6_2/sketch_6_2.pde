Flower rose;
 
void setup() {
  size(800, 800);
  rose = new Flower(width/2, height);
}
 
void draw() { 
  background(255);
  rose.update();
  rose.display();
}
