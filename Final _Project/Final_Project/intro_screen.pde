class IntroScreen {

  int stage;
  boolean done, limit, isWalking, visable, activated, isClicked;
  float xoff, yincrement1, yincrement2, yincrement3, xSpeed, start, i, samSpeed;
  PImage sam;
  PVector samLocation, buttonLocation, text1Location;
  String buttonText, welcomeText, gameRules;
  PFont myFont, myFont2;


  IntroScreen() {
    stage = 0;
    xoff = 0;
    yincrement1 = 0.004;    //changes the sharpness or smoothness level of the mountains
    yincrement2 = 0.003;
    yincrement3 = 0.002;
    start= 0;
    xSpeed = 0.001;
    samSpeed = 5; // chamnge back to 2, this is so i dont have to wait 5h forh im to walk
    i=0;
    limit = false;
    sam = loadImage("image/stickfigure.png");
    samLocation = new PVector(220, 630);
    buttonLocation = new PVector(width/2+220, 600);
    text1Location = new PVector(width/2 - 50, 100);
    isWalking = true;
    visable = true;
    activated = false;
    isClicked = false;
    buttonText = "START GAME";
    welcomeText = "AIR HOCKEY ";
    gameRules = "Welcome to our Airhockey game :) The rules are simple, just like in a normal airhockey game. Players can controll the controllers using the WSAD and the arrow keys. The starting player gets to start the game by dragging and shooting the puck in the opponets direction. Good luck and may the odds be ever in your favor.";
    myFont = createFont("Calibri Bold", 50);
    myFont2 = createFont("Calibri Bold", 25);
  }

  void display() {
    hills();
    Sam();
    if (stage == 0) {
      part1();
      walkingSam();
      println(1);
    } else if (stage == 1) {
      part2();
      hover();
      buttonPressed();
      println(2);
    } else if (stage == 2) {
      part3();
      println(3);
    }
  }

  void Sam() { // character sam 
    imageMode(CENTER);
    sam.resize(0, 700);
    image(sam, samLocation.x, samLocation.y + i);

    //making the character move up and down
    if (!limit && i == 20) {
      limit = true;
    } else if (limit && i == -20) {
      limit = false;
    } else if (!limit && i <= 20) {
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
    //introducing the game
    fill(250, 125, 121);
    textFont(myFont);
    text(welcomeText, text1Location.x - 50, text1Location.y);
    fill(171, 209, 105);
    textFont(myFont2);
    text(gameRules, text1Location.x - 400, text1Location.y + 80, 900, 200);

    //function for the start button. 
    {
      fill(110, 255, 242);
      textSize(35);
      if (hover()) {
        fill(186, 255, 161);
      }
      rect(buttonLocation.x, buttonLocation.y, textWidth(buttonText)+5, 55);
      fill(250, 125, 121);
      text(buttonText, buttonLocation.x, buttonLocation.y + 40);
    }
  }

  // making the button work like a button, if the mouse is over it, it changes color
  boolean hover() {
    if (mouseX >= buttonLocation.x && mouseY >= buttonLocation.y && mouseX <= buttonLocation.x + textWidth(buttonText) && mouseY <= buttonLocation.y + 55) {
      return true;
    }
    return false;
  }

  //making the button clickable
  void buttonPressed() {
    if (hover()) {
      println("Whoo clicky!");
      stage = stage+1;
      println(stage);
    }
  }

  void part3() { //character moves to the right side until it has reached it
    println("NEW NEW!");
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
