class Player {
  PVector location;
  float sizeMain, sizeLight, sizeDark;
  color main, light, dark; 

  Player() {
    location = new PVector(width/4, height/2);
    sizeMain = 90;
    sizeLight = 75;
    sizeDark = 40;
    main = color(185, 201, 91); 
    light = color(209, 228, 102); 
    dark = color(150, 163, 73);
  }
  void update() {
  }
  void display() {
    // Yellow player
    noStroke();
    fill (main);                            //main
    circle(xLoc, yLoc, sizeMain);
    fill (light);                           //lighter
    circle(xLoc, yLoc, sizeLight);
    fill (dark);                            //darker (f u)
    circle(xLoc - 4, yLoc + 4, sizeDark);
    fill (main);                            //main
    circle(xLoc, yLoc, sizeDark);
  }
}
