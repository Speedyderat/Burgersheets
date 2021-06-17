class Player2 {
  PVector location;
  float sizeMain, sizeLight, sizeDark;
  color main, light, dark; 

  Player2() {
    location = new PVector(width *3/4, height/2);
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
    circle(location.x, location.y, 90);  
    fill (light);                             //lighter
    circle(location.x, location.y, 75);
    fill (dark);                               //darker
    circle(location.x + 4, location.y + 4, 40);
    fill (main);                             //main
    circle(location.x, location.y, 40);
  }
}
