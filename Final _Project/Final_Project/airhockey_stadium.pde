class Stadium {

  PImage underground;
  int bordersize, uppergoal, lowergoal, goalsize;

  Stadium() {
    underground = loadImage("image/underground.png");
    bordersize = 10;
    goalsize = 50;
    uppergoal = height/2 - goalsize/2;
    lowergoal = height/2 + goalsize/2;
  }

  void underground() {
    image(underground, 0, 0, width, height);
  }

  void borderPhysics(Puck puck, Player player, Player2 player2) {
    if ((puck.location.y <= bordersize) || (puck.location.y >= height-bordersize)) {
      puck.acceleration.y =- puck.acceleration.y;
    } else if (( (puck.location.y <= uppergoal) && ((puck.location.x <= bordersize) || (puck.location.x >= width - bordersize)) )
      || ((puck.location.y >= lowergoal) && ((puck.location.x <= bordersize) || (puck.location.x >= width - bordersize)))) {
      puck.acceleration.x =- puck.acceleration.x;
    }    
    //collision detection for the player
    if ((player.location.y <= bordersize) || (player.location.y >= height-bordersize)) {
      player.acceleration.y =- player.acceleration.y;
    } else if (( (player.location.y <= uppergoal) && ((player.location.x <= bordersize) || (player.location.x >= width - bordersize)) )
      || ((player.location.y >= lowergoal) && ((player.location.x <= bordersize) || (player.location.x >= width - bordersize)))) {
      player.acceleration.x =- player.acceleration.x;
    }
        //collision detection for the player2
    if ((player2.location.y <= bordersize) || (player2.location.y >= height-bordersize)) {
      player2.acceleration.y =- player2.acceleration.y;
    } else if (( (player2.location.y <= uppergoal) && ((player2.location.x <= bordersize) || (player2.location.x >= width - bordersize)) )
      || ((player2.location.y >= lowergoal) && ((player2.location.x <= bordersize) || (player2.location.x >= width - bordersize)))) {
      player2.acceleration.x =- player2.acceleration.x;
    }
  }

  void goal(Puck puck) {
    if ((puck.location.y >= uppergoal) && ((puck.location.x <= 0) || (puck.location.x >= width))) {
      puck.reset();
      //game.score +1;
    }
  }
}
