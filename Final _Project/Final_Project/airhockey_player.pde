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
    circle(location.x, location.y, sizeMain);
    fill (light);                           //lighter
    circle(location.x, location.y, sizeLight);
    fill (dark);                            //darker (f u)
    circle(location.x - 4, location.y + 4, sizeDark);
    fill (main);                            //main
    circle(location.x, location.y, sizeDark);
  }
}
