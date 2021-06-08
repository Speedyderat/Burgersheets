int num = 3; 
Spring[] springs = new Spring[num]; 
  int size = 200; 
 
void setup() {
  size(640, 360);
  noStroke(); 
  springs[0] = new Spring(width/2, height-size, 40, 0.98, 8.0, 0.1, springs, 0); 
  springs[1] = new Spring(width, height, 120, 0.95, 9.0, 0.1, springs, 1); 
  springs[2] = new Spring(width, height, 200, 0.90, 9.9, 0.1, springs, 2);
}
 
void draw() {
  background(51); 
 
  for (int i = 0; i<springs.length; i++) { 
    springs[i].update(); 
    springs[i].display();
  }
}
