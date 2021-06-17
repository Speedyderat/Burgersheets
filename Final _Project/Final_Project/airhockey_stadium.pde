class Stadium {

  PImage underground;
  int bordersize;

  Stadium() {
    underground = loadImage("image/underground.png");
    bordersize = 10;
  }

  void underground() {
    image(underground, 0, 0, width, height);
  }

  void borderPhysics(Puck puck) {
    if ((puck.location.x <= bordersize) && (puck.location.x >= width-bordersize)) {
      puck.acceleration.y -= puck.acceleration.y;
    }

    if ((puck.location.x <= uppergoalX) && ((puck.location.y <= bordersize) || (puck.location.y <= height - bordersize))) {
    }
  }
}
