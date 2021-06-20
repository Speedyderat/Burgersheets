class OutroScreen {
  ParticleSystem particleSystem;
  PImage player1, player2, background;

  OutroScreen() {
    particleSystem = new ParticleSystem();
    background = loadImage("image/outroBackground.png");
    player1 = loadImage("image/player1.png");
    player2 = loadImage("image/player2.png");
  }

  void display(Game game) {
    imageMode(CORNER);
    image(background, 0, 0);
    imageMode(CENTER);
    particleSystem.update();
    particleSystem.display();


    if (game.woop == true) {
      image(player1, width/2, height/2);
    } else if (game.woop2 == true) {
      image(player2, width/2, height/2);
    }
  }
}
