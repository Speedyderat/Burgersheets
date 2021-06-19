class IntroScreen {

  int Stage, samDepth, samSize;
  boolean limit, hover, doorReached;
  float xoff, yincrement1, yincrement2, yincrement3, xSpeed, start, i, samSpeed, buildingSpeed;
  PImage sam, building;
  PVector samLocation, buttonLocation, text1Location, buildingLocation;
  String buttonText, welcomeText, gameRules;
  PFont myFont, myFont2;


  IntroScreen() {
    Stage = 0;

    yincrement1 = 0.004;    //changes the sharpness or smoothness level of the mountains
    yincrement2 = 0.003;
    yincrement3 = 0.002;
    xSpeed = 0.001;

    samSpeed = 5; // chamnge back to 2, this is so i dont have to wait 5h forh im to walk
    buildingSpeed = 5;
    limit = false;
    doorReached = false;
    samDepth = 255;
    samSize = 700;

    sam = loadImage("image/stickfigure.png");
    building = loadImage("image/stadium.png");

    samLocation = new PVector(220, 630);
    buttonLocation = new PVector(width/2+220, 600);
    text1Location = new PVector(width/2 - 50, 100);
    buildingLocation = new PVector(width +150, 0);

    buttonText = "START GAME";
    welcomeText = "AIR HOCKEY ";
    gameRules = "Welcome to our Airhockey game :) The rules are simple, just like in a normal airhockey game. Players can controll the controllers using the WSAD and the arrow keys. The starting player gets to start the game by dragging and shooting the puck in the opponets direction. Good luck and may the odds be ever in your favor.";
    myFont = createFont("Calibri Bold", 50);
    myFont2 = createFont("Calibri Bold", 25);
  }

  void display() {
    background(164, 227, 236);

    hills();

    // stage 0 is where sam walks into the screen
    if (Stage == 0) {

      if (samLocation.x > width/2) {
        Stage++;
      }

      // in stage 1 sam stays in the middle of the screen, walking while the explaination of the game is being presented
    } else if (Stage == 1) {
      samSpeed = 0;
      introText();

      // teuetueu
    } else if (Stage == 2) {

      if (samLocation.x > width *3/4 + 50) {
        samSpeed = 0;

        if (doorReached && (samSize > 0 || samDepth > 0)) {
          samSize -= 7;
          samDepth -= 5;
        }
      } else {
        samSpeed = 2;
      }

      building();
    }
    sam();
  }

  void sam() { // character sam 
    imageMode(CENTER);
    sam.resize(0, samSize);
    tint(255, samDepth);
    image(sam, samLocation.x, samLocation.y + i);
    tint(255, 255);
    samLocation.x += samSpeed;    //adding movement for sam to walk into the screen

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

  void introText() { //character stays in the middle of the screen while the name of the game pops up
    //introducing the game
    fill(250, 125, 121);
    textFont(myFont);
    text(welcomeText, text1Location.x - 50, text1Location.y);
    fill(171, 209, 105);
    textFont(myFont2);
    text(gameRules, text1Location.x - 400, text1Location.y + 80, 900, 200);

    //function for the start button. 
    fill(110, 255, 242);
    textSize(35);
    if (hover) {
      fill(186, 255, 161);
    }
    rect(buttonLocation.x, buttonLocation.y, textWidth(buttonText)+5, 55);
    fill(250, 125, 121);
    text(buttonText, buttonLocation.x, buttonLocation.y + 40);
  }

  void building() {

    imageMode(CORNER);
    image(building, buildingLocation.x, buildingLocation.y);

    if (buildingLocation.x == 0) {
      buildingSpeed = 0;
      doorReached = true;
    } else {
      buildingLocation.x -= buildingSpeed;    //adding movement for sam to walk into the screen
    }
  }

  // making the button work like a button, if the mouse is over it, it changes color
  void mouseMovedEvent(PVector mouse) {
    if (mouse.x >= buttonLocation.x && mouse.y >= buttonLocation.y && mouse.x <= buttonLocation.x + textWidth(buttonText) && mouse.y <= buttonLocation.y + 55) {
      hover = true;
    }
  }

  //making the button clickable
  void mousePressedEvent() {
    if (hover) {
      Stage++;
    }
  }





















  void hills() { //the continuesly moving background
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

  //boolean introdone() { //when the character has reached the edge the intro is done

  //  return done;
  //}

  //void mouseClickEvent() {
  //}
}
