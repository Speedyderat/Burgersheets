// outro screen, winner screen

//In our outro / winner screen the winner will be presented and congratulated on his achievement accompanied by an explosion of confetti made possible by our particle system, 
//the game is finished.

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
    particleSystem.update();                                      // shows the particle explosion selebration effect
    particleSystem.display();

    if (game.woop == true) {                                      //checks which player won and displayes the coresponding picture for them
      image(player1, width/2, height/2);
    } else if (game.woop2 == true) {
      image(player2, width/2, height/2);
    }
  }
}
