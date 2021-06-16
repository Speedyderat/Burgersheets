//beep

introScreen introscreen;

void setup() {
  introscreen = new introScreen();
}

void draw() {
  introscreen.display();
}

void mouseClicked() {
  introscreen.mouseClickEvent()
}
