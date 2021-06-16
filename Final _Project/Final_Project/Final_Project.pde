//beep

IntroScreen introscreen;
Game game;
OutroScreen outroscreen;

void setup() {
  size(1000, 706); //because of size of the background of the stadium
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
