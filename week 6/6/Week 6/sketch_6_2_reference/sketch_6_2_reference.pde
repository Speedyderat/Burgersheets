Tree[] trees= new Tree[20];
 
 
void setup() {
  size(800, 800);
  for (int i = 0; i<trees.length; i++) {
    trees[i] = new Tree(i*15+width/2-150, height);
  }
}
 
void draw() { 
  background(255);
 
  //tree.draw();
  for (int i = 0; i<trees.length; i++) {
      trees[i].update();
    trees[i].display();
  }
}
