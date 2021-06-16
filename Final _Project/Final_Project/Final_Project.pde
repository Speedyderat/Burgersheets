//beep

IntroScreen introscreen;
Game game;
OutroScreen outroscreen;

int stage;

void setup() {
  size(1000, 706); //because of size of the background of the stadium
  
  introscreen = new IntroScreen();
  game = new Game();
  outroscreen = new OutroScreen();
  
  stage = 0;
}

void draw() {
  if (stage == 0) {
    introscreen.display();
  } else if (stage == 1) {
    game.display();
  } else if (stage == 2) {
    outroscreen.display();
  }
}

void mouseClicked() {
  if (stage == 0) {
    introscreen.mouseClickEvent();
  }
}
