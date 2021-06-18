class IntroScreen {

  int stage;
  boolean done;
  float xoff;
  float xincrement1; 
  float xincrement2;
  float xincrement3; 
  float start;

  IntroScreen() {
    stage = 0;
    xoff = 0;
    xincrement1 = 0.001;    //changes the sharpness or smoothness level of the mountains
    xincrement2 = 0.001;
    xincrement3 = 0.001;
    start= 0;
  }

  void display() {
    hills();
    if (stage == 0) {
      part1();
    } else if (stage == 1) {
      part2();
    } else if (stage == 2) {
      part3();
    }
  }

  void part1() { // character moves into the screen from the left
  }
  void part2() { //character stays in the middle of the screen while the name of the game pops up
  }  
  void part3() { //character moves to the right side until it has reached it
  }

  void hills() { //the continuesly moving background
    background(164, 227, 236);
    noStroke(); 

    //mountain 1
    fill( 251, 197, 196);

    beginShape();
    vertex(0, height);
    xoff = start;

    for (float x = 0; x < width; x++) {
      stroke(255);
      float y = map(noise(xoff) * height, 0, height, 100, 250); // location of the mountains
      vertex(x, y);
      xoff += xincrement1;
    }

    vertex(width, height);
    endShape();

    start += xincrement1;

    //mountain 2
    fill(252,162,139);

    beginShape();
    vertex(0, height);
    xoff = start;

    for (float x = 0; x < width; x++) {
      stroke(255);
      float y = map(noise(xoff) * height, 0, height, 200, 350); // location of the mountains
      vertex(x, y);
      xoff += xincrement2;
    }

    vertex(width, height);
    endShape();

    start += xincrement2;

    //mountain 3
    fill(250, 125, 121);

    beginShape();
    vertex(0, height);
    xoff = start;

    for (float x = 0; x < width; x++) {
      stroke(255);
      float y = map(noise(xoff) * height, 0, height, 300, 450); // location of the mountains
      vertex(x, y);
      xoff += xincrement3;
    }

    vertex(width, height);
    endShape();

    start += xincrement3;
  }
}

//boolean introdone() { //when the character has reached the edge the intro is done

//  return done;
//}

//void mouseClickEvent() {
//}
