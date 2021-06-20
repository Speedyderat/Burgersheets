class OutroScreen {
  //  Game game;
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
    particleSystem.run();
    particleSystem.addParticle();
    imageMode(CENTER);
    if (game.woop == true) {
      image(player1, width/2, height/2);
      println("aaaah");
    } else if (game.woop2 == true) {
      println("aaaah");
      image(player2, width/2, height/2);
    }
  }
}
