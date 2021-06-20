/* This program has been written by Jasper Bosschart (s2562685) & Marina Stefanova (s2610604) and is the final assignemtn from module 4 CreaTe 2021 */

//Our final project is an Air Hockey game with an introduction and a winning screen. 
//The project is created with knowledge we gained during the assignments we did this module, and during previous modules. 
//We also used examples from Daniel Shiffman’s The Nature of Code and a simple air hockey game that we took inspiration from, but made our own.

//(sources on the bottom of the screen)

IntroScreen introscreen;                                                 //the introduction screen
Game game;                                                               //the actual game
OutroScreen outroscreen;                                                 //winning screen


int stage;

void setup() {
  size(1000, 706);                                                       //because of the size of the background of the stadium
  smooth(4);                                                             //speeds up the program to make the movement seem more fluent

  introscreen = new IntroScreen();
  game = new Game();
  outroscreen = new OutroScreen();

  stage = 0;                                                             //stage is set to 0 at the start
}

void draw() {

  stagechecker();                                                        //stage checker that checks if the intro or game is done so it can switch to the next stage

  if (stage == 0) {
    introscreen.display();
  } else if (stage == 1) {
    game.run();
  } else if (stage == 2) {
    outroscreen.display(game);                                           //needs input from game to display which player has won
  }
}

void stagechecker() {
  if (stage != 2 && (introscreen.introdone() || game.gamedone())) {      //stage checker that checks if the intro or game is done so it can switch to the next stage
    stage++;
  }
}

void mouseDragged() {
  game.mouseDraggedEvent(new PVector(mouseX, mouseY));                   //takes mouse input when dragging the puck at the start of the game or after scoring a goal
}

void mouseReleased() {
  game.mouseReleasedEvent();                                             //checks if the mouse is released to launch the puck
}

void mousePressed() {
  introscreen.mousePressedEvent();                                       //checks if the start button has been pressed
}

void mouseMoved() {
  introscreen.mouseMovedEvent(new PVector(mouseX, mouseY));              //takes mouse input when hovering the mouse over the screen in the intro, needed for the start button
}

void keyPressed() {
  game.keyPressedEvent();                                                //event to register keypresses for the movement of the paddles
}

void keyReleased() {
  game.keysReleasedEvent();                                              //event to register keyreleases to stop the movement of the paddles
}

//sources used:
// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Air Hockey game by Andreas
// Andreas
// https://openprocessing.org/sketch/975642

// Graphing 1D Perlin Noise (1D Noise Graph)
// https://youtu.be/y7sgcFhk6ZM

// The Coding Train / Daniel Shiffman
// https://thecodingtrain.com/learning/noise/0.4-graphing-1d.html
