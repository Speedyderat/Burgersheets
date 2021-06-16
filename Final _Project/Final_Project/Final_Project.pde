//beep

IntroScreen introscreen;
Game game;
OutroScreen outroscreen;

void setup() {
  introscreen = new IntroScreen();
  game = new Game();
  outroscreen = new OutroScreen();
}

void draw() {
  introscreen.display();
}

void mouseClicked() {
  introscreen.mouseClickEvent();
}
