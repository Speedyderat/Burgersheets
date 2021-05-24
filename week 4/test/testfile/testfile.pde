/* This program has been written by Jasper Bosschart (s2562685) & Marina Stefanova (s2610604), assignment 4 from module 4 CreaTe 2021 */
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
  ps.addParticle();                                                                //adds a particle when the mouse is clicked
  wand.display();                                                                  //displays the wand
  
}

void mouseMoved() {
wand.mouseMovedEvent(new PVector(mouseX, mouseY));                                 //moving the mouse moves the wand
}

void mouseDragged() {                                                              //dragging the mouse moves the wand and the particle origin
  ps.mouseDraggedEvent(new PVector(mouseX, mouseY));
  wand.mouseMovedEvent(new PVector(mouseX, mouseY));
}

void mouseReleased() {                                                             // releasing the mouse stops the the particles
  ps.mouseReleasedEvent();
}
