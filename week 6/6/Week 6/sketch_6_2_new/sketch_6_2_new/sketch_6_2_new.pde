//written by Vera Schockemöhle, s2397277 , and Konrad Rempe, s2321041.
Flower[] power = new Flower[50];
PVector origin;

void setup() {
  size(1000, 750);
  for (int i = 0; i<power.length; i++) {
    origin = new PVector(random(25, width-25), height);
    power[i] = new Flower(origin);
  }
}

void draw() {
  frameRate(10);
  background(100, 199, 255);
  for (int i = 0; i<power.length; i++) {
    power[i].update();
    power[i].updateWind();
    power[i].display();
  }
}
