class IntroScreen {

  int stage;
  boolean done, limit;
  float xoff, yincrement1, yincrement2, yincrement3, xSpeed, start, i;
  PImage sam;


  IntroScreen() {
    stage = 0;
    xoff = 0;
    yincrement1 = 0.004;    //changes the sharpness or smoothness level of the mountains
    yincrement2 = 0.003;
    yincrement3 = 0.002;
    start= 0;
    xSpeed = 0.001;
    i=0;
    limit = false;
    sam = loadImage("image/stickfigure.png");
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
    imageMode(LEFT);
    sam.resize(0, 700);
    image(sam, width/2, 610 + i);
    
    //making the character move up and down
    if (!limit && i == 25) {
      limit = true;
    } else if (limit && i == -25) {
      limit = false;
    } else if (!limit && i <= 25) {
    i++;
    } else {
    i--;
    }
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
      xoff += yincrement1;
    }

    vertex(width, height);
    endShape();

    start += xSpeed;

    //mountain 2
    fill(252, 162, 139);

    beginShape();
    vertex(0, height);
    xoff = start;

    for (float x = 0; x < width; x++) {
      stroke(255);
      float y = map(noise(xoff) * height, 0, height, 300, 450); // location of the mountains
      vertex(x, y);
      xoff += yincrement2;
    }

    vertex(width, height);
    endShape();

    start += xSpeed;

    //mountain 3
    fill(250, 125, 121);

    beginShape();
    vertex(0, height);
    xoff = start;

    for (float x = 0; x < width; x++) {
      stroke(255);
      float y = map(noise(xoff) * height, 0, height, 500, 550); // location of the mountains
      vertex(x, y);
      xoff += yincrement3;
    }

    vertex(width, height);
    endShape();

    start += xSpeed;
  }
}

//boolean introdone() { //when the character has reached the edge the intro is done

//  return done;
//}

//void mouseClickEvent() {
//}
