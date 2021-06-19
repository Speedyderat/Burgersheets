class Game {

  Stadium stadium;
  Player player;
  Player2 player2;
  Puck puck;

  boolean done; 

  Game() {
    stadium = new Stadium();
    player = new Player();
    player2 = new Player2();
    puck = new Puck();

    done = false;
  }

  void run() {
    stadium.underground();
    stadium.goal(puck);
    //goals, class stadium
    stadium.borderPhysics(puck, player, player2);
    player.run();
    player2.run();
    player.collision(puck);
    player2.collision(puck);
    puck.run();
    //the wall around, class stadium
    //details, maybe the railing in the middle, class stadium
  }
  void score (String scorer) {
    if (scorer.equals("p1")) {
      player.score(1);
    } else if (scorer.equals("p2")) {
      player2.score(1);
    }
  }

  boolean gamedone() { //when the character has reached the edge the intro is done
    if (player.score(0) == 3 || player2.score(0) == 3) {
      return true;
    } else {
      return false;
    }
  }

  void mouseDraggedEvent(PVector mouseLocation) {
    puck.mouseDraggedEvent(mouseLocation);
  }

  void mouseReleasedEvent() {
    puck.mouseReleasedEvent();
  }


  void keyPressedEvent() {
    player.keysPressedEvent();
    player2.keysPressedEvent();
  }

  void keysReleasedEvent() {
    player.keysReleasedEvent();
    player2.keysReleasedEvent();
  }
}
