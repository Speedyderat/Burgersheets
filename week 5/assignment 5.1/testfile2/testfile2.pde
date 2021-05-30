// Much credit due to:
// Daniel Shiffman's <http://www.shiffman.net> The Nature of Code, 
// Steering Behavior examples

ArrayList obs;
Boid wanderer;
boolean debug = true;

void setup() {
  size(600, 500);
  wanderer = new Boid(new PVector(width/2, height/2), 2.0, 0.1);
  smooth();
  obs = new ArrayList();
}

void draw() {
  background(255);
  for ( int i = 0; i < obs.size(); i++ ) {
    ((Poly)obs.get(i)).show();
  }
  wanderer.obstacleAvoid();
  wanderer.run();
}

void keyPressed() {
  debug = !debug;
}
void mousePressed() {
  //create a new obstacle
  //a rotated square of a random size
  float siz = random(30, 50);
  float r = random(0, PI);
  ArrayList p = new ArrayList();
  p.add(new PVector(siz*cos(r), siz*sin(r)));
  p.add(new PVector(siz*cos(r+0.5*PI), siz*sin(r+0.5*PI)));
  p.add(new PVector(siz*cos(r+PI), siz*sin(r+PI)));   
  p.add(new PVector(siz*cos(r+1.5*PI), siz*sin(r+1.5*PI)));
  obs.add(new Poly(mouseX, mouseY, p));
}
