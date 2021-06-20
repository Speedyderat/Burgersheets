//beep
IntroScreen introscreen;
Game game;
OutroScreen outroscreen;


int stage;

void setup() {
  size(1000, 706); //because of size of the background of the stadium
  smooth(4);

  introscreen = new IntroScreen();
  game = new Game();
  outroscreen = new OutroScreen();

  stage = 0;
}

void draw() {
  stagechecker();
  if (stage == 0) {
    introscreen.display();
  } else if (stage == 1) {
    game.run();
  } else if (stage == 2) {
    outroscreen.display(game);
  }
}

void stagechecker() {
  if (stage != 2 && (introscreen.introdone() || game.gamedone())) {
    stage++;
  }
}

void mouseDragged() {
  // introscreen.mouseClickEvent();
  game.mouseDraggedEvent(new PVector(mouseX, mouseY));
}

void mouseReleased() {
  game.mouseReleasedEvent();
}

void mousePressed() {
  introscreen.mousePressedEvent();
}

void mouseMoved() {
  introscreen.mouseMovedEvent(new PVector(mouseX, mouseY));
}

void keyPressed() {
  game.keyPressedEvent();
}

void keyReleased() {
  game.keysReleasedEvent();
}
