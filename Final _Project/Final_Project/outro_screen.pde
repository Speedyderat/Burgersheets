// outro screen, winner screen

//In our outro / winner screen the winner will be presented and congratulated on his achievement accompanied by an explosion of confetti made possible by our particle system, 
//the game is finished.

class OutroScreen {
  ParticleSystem particleSystem;
  PImage player1, player2, background;
  float glisterRadius, standardDeviationMax, standardDeviationMin, mean, mean2;
  PVector glisterLocation;

  OutroScreen() {
    particleSystem = new ParticleSystem();

    background = loadImage("image/outroBackground.png");
    player1 = loadImage("image/player1.png");
    player2 = loadImage("image/player2.png");

    standardDeviationMax = 20;                                     // Define a standard deviation
    standardDeviationMin = 10;
    mean = width/2;                                                // Define a mean value (middle of the screen along the x-axis)
    mean2 = height/2+75;
  }

  void display(Game game) {
    imageMode(CORNER);
    image(background, 0, 0);
    imageMode(CENTER);

    particleSystem.update();                                      // shows the particle explosion selebration effect
    particleSystem.display();

    if (game.woop == true) {                                      //checks which player won and displayes the coresponding picture for them
      image(player1, width/2, height/2);
      glistening();                                               // glistening effect on the cup
    } else if (game.woop2 == true) {
      image(player2, width/2, height/2);
      glistening();                                               // glistening effect on the cup
    }
  }

  void glistening() {

    // Get a gaussian random number w/ mean of 0 and standard deviation of 1.0
    glisterLocation = new PVector(randomGaussian(), randomGaussian());
    glisterRadius  = randomGaussian();

    glisterLocation.mult(standardDeviationMax);                                             // Scale the gaussian random number by standard deviation and mean
    glisterLocation.x += mean;
    glisterLocation.y += mean2;
    glisterRadius  = ( glisterRadius *  standardDeviationMin ) + random(0, 20);

    noStroke();
    fill(255, 251, 0, 69);                                                                 //golden glistening color for the cup
    ellipse(glisterLocation.x, glisterLocation.y, glisterRadius, glisterRadius);           // Draw an ellipse at our "normal" random position
  }
}
