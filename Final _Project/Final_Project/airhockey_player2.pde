class Player2 {
  float xLoc;
  float yLoc; 
  float sizeMain;
  float sizeLight;
  float sizeDark;
  color main; 
  color light; 
  color dark; 

  Player2() {
    xLoc = width* 3/4;
    yLoc = height/2; 
    sizeMain = 90;
    sizeLight = 75;
    sizeDark = 40;
    main = color(113, 209, 151); 
    light = color(128, 237, 172); 
    dark = color(78, 145, 105);
  }
  void update() {
  }
  void display() {
    // Green player 
    noStroke();
    fill (main);                              //main
    circle(xLoc, yLoc, 90);  
    fill (light);                             //lighter
    circle(xLoc, yLoc, 75);
    fill (dark);                               //darker
    circle(xLoc + 4, yLoc + 4, 40);
    fill (main);                             //main
    circle(xLoc, yLoc, 40);
  }
}
