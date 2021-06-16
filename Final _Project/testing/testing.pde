void setup () {
  size(500, 500);
  background (255);
}

void draw() {
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

  // Green player 
  noStroke();
  fill (113, 209, 151);                     //main
  circle(width/2, height/2, 90);
  fill (128, 237, 172);                     //lighter
  circle(width/2, height/2, 75);
  fill (78, 145, 105);                      //darker
  circle(width/2 - 4, height/2 + 4, 40);
  fill (113, 209, 151);                     //main
  circle(width/2, height/2, 40);
}
