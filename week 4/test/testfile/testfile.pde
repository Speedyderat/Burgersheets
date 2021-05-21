// Just one wee ParticleSystem!
ParticleSystem ps;
Wand wand;

void setup() {
  size(640,360);
  ps = new ParticleSystem(new PVector(width/2, 100));
  wand = new Wand();
}

void draw() {
  background(255);
  ps.run();
  ps.addParticle();
  wand.display();
  
}

void mouseMoved() {
wand.mouseMovedEvent(new PVector(mouseX, mouseY));
}

void mouseDragged() {                                                              //dragging the ball in the catapult
  ps.mouseDraggedEvent(new PVector(mouseX, mouseY));
  wand.mouseMovedEvent(new PVector(mouseX, mouseY));
}

void mouseReleased() {                                                             // releasing the ball from the catapult
  ps.mouseReleasedEvent();
}
