class Stadium {

  PImage underground;
  int bordersize, uppergoal, lowergoal, goalsize;

  Stadium() {
    underground = loadImage("image/underground.png");
    bordersize = 10;
    uppergoal = height/2 - goalsize/2;
    lowergoal = height/2 + goalsize/2;
  }

  void underground() {
    image(underground, 0, 0, width, height);
  }

  void borderPhysics(Puck puck) {
    if ((puck.location.y <= bordersize) && (puck.location.y >= width-bordersize)) {
      puck.acceleration.y -= puck.acceleration.y;
    }

    if (((puck.location.y <= uppergoal) && ((puck.location.x <= bordersize) || (puck.location.x <= height - bordersize)))
      || ((puck.location.y >= lowergoal) && ((puck.location.x <= bordersize) || (puck.location.x <= height - bordersize)))) {
        puck.acceleration.x -= puck.acceleration.x;
    }
  }
  
  //void goal();
  //if ((puck.location.y >= uppergoal) && ((puck.location.x <= 0) || (puck.location.x >= width))) {
  //puck.reset();
  ////game.score +1;
  //}
}
