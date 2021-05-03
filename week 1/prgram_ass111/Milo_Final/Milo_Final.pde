/* This program has been written by Jasper Bosschart (s2562685) & Marina Stefanova (s2610604), assignment 1.11 from Module 4 CreaTe 2021 
code Milo has been taken from previous assignment from Module 1*/

Milo[] milos = new Milo[10];

void setup() 
{
  size(1000, 1000); 
  for (int i = 0; i < milos.length; i++) { 
    milos[i] = new Milo();
  }
}

void draw() {
  background(225, 234, 215); 
  for (int i = 0; i < milos.length; i++) {
    milos[i].display();

    //see milo tab for reference about this code
    for (int a = 0; a < milos.length; a++) {
      if (a!=i) {
        milos[i].overlaps(milos[a]);
        milos[a].overlaps(milos[i]);
      }
    }
  }
}

void mousePressed() {
  for (int i = 0; i < milos.length; i++) {
    milos[i].Milopressed(mouseX, mouseY);
  }
}

void mouseReleased() {
  for (int i = 0; i < milos.length; i++) {
    milos[i].Miloreleased(mouseX, mouseY, pmouseX, pmouseY);
  }
}

void mouseDragged() {
  for (int i = 0; i < milos.length; i++) {
    milos[i].Milodragged(mouseX, mouseY);
  }
}

void mouseMoved() {
  for (int i = 0; i < milos.length; i++) {
    milos[i].Milomoved(mouseX, mouseY);
  }
}
