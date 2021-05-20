/* This program has been written by Jasper Bosschart (s2562685) & Marina Stefanova (s2610604), assignment 4 from module 4 CreaTe 2021 */

Wand wand;
ParticleSystem magicDust;

void setup() {
  magicDust = new ParticleSystem();// the wand needs a reference to the 
  magicDustwand = new Wand(magicDust);
}
void draw() {
  magicDust.update();
  wand.update();
  magicDust.render();
  wand.render();
}
void mouseDragged() {
  wand.MouseDraggedEvent(new PVector(mouseX, mouseY));
}
