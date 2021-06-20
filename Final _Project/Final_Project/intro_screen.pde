class IntroScreen {

  Hills hills;

  int Stage, samDepth, samSize, i, samSpeed, buildingSpeed;
  boolean limit, hover, doorReached;
  PImage sam, building;
  PVector samLocation, buttonLocation, text1Location, buildingLocation;
  PFont myFont, myFont2;
  String buttonText, welcomeText, gameRules;


  IntroScreen() {
    hills = new Hills();

    Stage = 0;
    samSpeed = 5; // change back to 2, this is so i dont have to wait 5h forh im to walk
    buildingSpeed = 5;
    samDepth = 255;
    samSize = 700;
    limit = false;
    doorReached = false;

    sam = loadImage("image/stickfigure.png");
    building = loadImage("image/stadium.png");

    samLocation = new PVector(220, 630);
    buttonLocation = new PVector(width/2+220, 600);
    text1Location = new PVector(width/2 - 50, 100);
    buildingLocation = new PVector(width +150, 0);

    myFont = createFont("Calibri Bold", 50);
    myFont2 = createFont("Calibri Bold", 25);
    buttonText = "START GAME";
    welcomeText = "AIRHOCKEY ";
    gameRules = "Welcome to our Airhockey game :) The rules are simple, just like in a normal airhockey game. Players can controll the controllers using the WSAD and the arrow keys. The starting player gets to start the game by dragging and shooting the puck in the opponets direction. Good luck and may the odds be ever in your favor.";
  }

  void display() {
    background(164, 227, 236);

    hills.display();

    // stage 0 is where sam walks into the screen
    if (Stage == 0) {

      if (samLocation.x > width/2) {
        Stage++;
      }

      // in stage 1 sam stays in the middle of the screen, walking while the explaination of the game is being presented
    } else if (Stage == 1) {
      samSpeed = 0;
      introText();

      // in stage
    } else if (Stage == 2) {

      if (samLocation.x > width *3/4 + 50) {
        samSpeed = 0;

        if (samSize == 0 || samDepth == 0) {
          stage++;
        } else if (doorReached && (samSize > 0 || samDepth > 0)) {
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

  boolean introdone() { //when the character has reached the edge the intro is done
    if (stage == 3) {
      return true;
    } else {
      return false;
    }
  }

  //making the button clickable
  void mousePressedEvent() {
    if (hover) {
      Stage++;
    }
  }
}
