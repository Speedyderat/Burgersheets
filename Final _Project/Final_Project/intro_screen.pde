class IntroScreen {

  int stage;
  boolean done, limit, isWalking, visable, activated;
  float xoff, yincrement1, yincrement2, yincrement3, xSpeed, start, i, samSpeed;
  PImage sam;
  PVector samLocation, buttonLocation, text1Location;
  String buttonText, welcomeText, gameRules;


  IntroScreen() {
    stage = 0;
    xoff = 0;
    yincrement1 = 0.004;    //changes the sharpness or smoothness level of the mountains
    yincrement2 = 0.003;
    yincrement3 = 0.002;
    start= 0;
    xSpeed = 0.001;
    samSpeed = 2;
    i=0;
    limit = false;
    sam = loadImage("image/stickfigure.png");
    samLocation = new PVector(220, 610);
    buttonLocation = new PVector(width/2, 100);
    text1Location = new PVector(120, 210);
    isWalking = true;
    visable = true;
    activated = false;
    buttonText = "START GAME";
    welcomeText = "AirHokey on steroids";
    gameRules = "Welcome to our Airhockey game :) The rules are simple, just like in a normal airhockey game. Players can controll the controllers using the WSAD and the arrow keys. The starting player gets to start the game by dragging and shooting the puck in the opponets direction. Good luck and may the odds be in your favor";
  }

  void display() {
    hills();
    Sam();
    if (stage == 0) {
      part1();
      walkingSam();
    } else if (stage == 1) {
      part2();
      over();
    } else if (stage == 2) {
      part3();
    }
  }

  void Sam() { // character sam 
    imageMode(CENTER);
    sam.resize(0, 700);
    image(sam, samLocation.x, samLocation.y + i);

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

  void part1() { // character moves into the screen from the left
    samLocation.x += samSpeed;    //adding movement for sam to walk into the screen
  }

  //a boolean method to stop the creature from walking
  boolean walkingSam() {
    if ((samLocation.x > width/2  && samSpeed > 0)) {
      samSpeed = 0;
      isWalking = false;
      stage = stage+1;
    }
    return isWalking;
  }

  void part2() { //character stays in the middle of the screen while the name of the game pops up
    textSize(10);
    //textAlign(CENTER);
    text(welcomeText, text1Location.x, text1Location.y);
    text(gameRules, text1Location.x, text1Location.y+100);
    {
      fill(200);
      textSize(34);
      if (over()) {
        fill(255);
      }
      rect(buttonLocation.x, buttonLocation.y, textWidth(buttonText)+5, 55);
      fill(0);
      text(buttonText, buttonLocation.x, buttonLocation.y + 40);
    }
  }


  boolean over() {
    if (mouseX >= buttonLocation.x && mouseY >= buttonLocation.y && mouseX <= buttonLocation.x + textWidth(buttonText) && mouseY <= buttonLocation.y + 55) {
      return true;
    }
    return false;
  }

  void buttonPressed() {
    if (over()) {
      println("Whoo clicky!");
    }
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
