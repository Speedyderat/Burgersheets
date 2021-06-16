class Player {

  Player() {
  }
  void update() {
  }
  void display() {
    // Yellow player
    noStroke();
    fill (185, 201, 91);                      //main
    circle(width/2, height/2, 90);
    fill (209, 228, 102);                     //lighter
    circle(width/2, height/2, 75);
    fill (150, 163, 73);                      //dadrjer
    circle(width/2 - 4, height/2 + 4, 40);
    fill (185, 201, 91);                      //main
    circle(width/2, height/2, 40);
  }
}
