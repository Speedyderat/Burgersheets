class Stadium {

  PImage underground;
  int bordersize, uppergoal, lowergoal, goalsize;

  Stadium() {
    underground = loadImage("image/underground.png");
    
    bordersize = 10;
    goalsize = 150;
    
    uppergoal = height/2 - goalsize/2;
    lowergoal = height/2 + goalsize/2;
  }

  void underground() {
    //underground with "airholes"
    image(underground, 0, 0, width, height);
    
    //goals 
    stroke(0);
    strokeWeight(10);
    line(0, uppergoal, 0, lowergoal);
    line(width, uppergoal, width, lowergoal);
    
    //potential add: middle dot / lines
  }

  void goal(Puck puck) {
    if (((puck.location.y >= uppergoal) && (puck.location.y <= lowergoal)) && ((puck.location.x <= 0) || (puck.location.x >= width))) {
      puck.reset();
      println("goal");
      if (puck.location.x < width/2) {
        //game.score(true) +1;
      } else {
        //game.score(false) +1;
      }
    }
  }

  void borderPhysics(Puck puck, Player player, Player2 player2) { //very long block of code for the borders of the stadium, first part is for the puck, second part is for player 1 and the last part is for player 2


    //borders for the puck
    if ((puck.location.y <= bordersize) || (puck.location.y >= height-bordersize)) {                                          // Y axies borders for the puck

      if (puck.location.y < height/2) {                                                                                       // check if at the top or bottom of the screen to set the puck back into the stadium to avoid glitches
        puck.location.y = bordersize;
      } else {
        puck.location.y = height - bordersize;
      }

      puck.acceleration.y =- puck.acceleration.y;                                                                             // reverse the movement of the puck
    } 

    if (( (puck.location.y <= uppergoal) && ((puck.location.x <= bordersize) || (puck.location.x >= width - bordersize)) )
      || ((puck.location.y >= lowergoal) && ((puck.location.x <= bordersize) || (puck.location.x >= width - bordersize)))) {  // X axies borders for the puck, long because of the gap left open for the goals (we use the actual borders of the screen as scoring conditions)

      if (puck.location.x < width/2) {                                                                                        // check if at the top or bottom of the screen to set the puck back into the stadium to avoid glitches
        puck.location.x = bordersize;
      } else {
        puck.location.x = width - bordersize;
      }

      puck.acceleration.x =- puck.acceleration.x;                                                                             // reverse the movement of the puck
    } 


    //collision detection for the player
    if ((player.location.y <= bordersize) || (player.location.y >= height-bordersize)) {                                      // Y axies borders for the player

      if (player.location.y < height/2) {                                                                                     // check if at the left or right of the screen to set the puck back into the stadium to avoid glitches
        player.location.y = bordersize;
      } else {
        player.location.y = height - bordersize;
      }

      player.acceleration.y =- player.acceleration.y;                                                                         // reverse the movement of the player
    } 

    if ((player.location.x <= bordersize) || (player.location.x >= width - bordersize)) {                                     // X axies borders for the player

      if (player.location.x < width/2) {
        player.location.x = bordersize;
      } else {
        player.location.x = width - bordersize;
      }

      player.acceleration.x =- player.acceleration.x;
    }


    //collision detection for the player2
    if ((player2.location.y <= bordersize) || (player2.location.y >= height-bordersize)) {                                    // Y axies borders for player 2

      if (player2.location.y < height/2) {
        player2.location.y = bordersize;
      } else {
        player2.location.y = height - bordersize;
      }

      player2.acceleration.y =- player2.acceleration.y;
    }

    if ((player2.location.x <= bordersize) || (player2.location.x >= width - bordersize)) {                                     // X axies borders for player 2

      if (player2.location.x < width/2) {
        player2.location.x = bordersize;
      } else {
        player2.location.x = width - bordersize;
      }

      player2.acceleration.x =- player2.acceleration.x;
    }
  }
}
