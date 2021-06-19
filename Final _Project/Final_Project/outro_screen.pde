class OutroScreen {
  ParticleSystem particleSystem;
  PImage player1, player2, background;

  OutroScreen() {
    particleSystem = new ParticleSystem();
    background = loadImage("image/outroBackground.png");
    player1 = loadImage("image/player1.png");
    player2 = loadImage("image/player2.png");
  }

  void display() {
    imageMode(CORNER);
    image(background, 0, 0);
    particleSystem.run();
    particleSystem.addParticle();
  }
  
  
}
