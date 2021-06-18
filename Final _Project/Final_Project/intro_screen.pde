class IntroScreen {

  int stage;
  boolean done;
  float xoff;
  float xincrement; 
  float start;

  IntroScreen() {
    stage = 0;
    xoff = 0;
    xincrement = 0.01;
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
    background(164,227,236);
    stroke(0);
    fill(200);

    beginShape();
    vertex(0, height);
    float xoff = start;

    for (float x = 0; x < width; x++) {
      stroke(255);
      // let y = random(height);
      float y = map(noise(xoff) * height, 0, height, 200, 350);
      vertex(x, y);
      xoff += xincrement;
    }

    vertex(width, height);
    endShape();

    start += xincrement;
    fill(150);
    rect(0, 400, width, height);
  }
}

//boolean introdone() { //when the character has reached the edge the intro is done

//  return done;
//}

//void mouseClickEvent() {
//}
