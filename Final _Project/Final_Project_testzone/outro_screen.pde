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
    splash();
    particleSystem.update();                                      // shows the particle explosion selebration effect
    particleSystem.display();

    if (game.woop == true) {                                      //checks which player won and displayes the coresponding picture for them
      image(player1, width/2, height/2);
    } else if (game.woop2 == true) {
      image(player2, width/2, height/2);
    }
  }

  void splash() {
    // Get a gaussian random number w/ mean of 0 and standard deviation of 1.0
    float xloc = randomGaussian();
    float yloc = randomGaussian();
    float normalvariablename  = randomGaussian();

    float sd = 60;                // Define a standard deviation
    float nsd = 20;
    float mean = width/2;         // Define a mean value (middle of the screen along the x-axis)
    float bean = height/2;
    xloc = ( xloc * sd ) + mean;  // Scale the gaussian random number by standard deviation and mean
    yloc = ( yloc * sd ) + bean;  // Scale the gaussian random number by standard deviation and bean
    normalvariablename  = ( normalvariablename *  nsd ) + random(0, 20);

    fill(255, 251, 0, 69);
    noStroke();
    ellipse(xloc, yloc, normalvariablename, normalvariablename);   // Draw an ellipse at our "normal" random position
  }
}
