class introScreen {

  int stage;
  boolean done;

  introScreen() {
    stage = 0;
  }

  void display() {
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

  boolean introdone() { //when the character has reached the edge the intro is done
    
    return done;
  }

  void mouseClickEvent() {
  }
}
