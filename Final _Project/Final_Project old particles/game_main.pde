class Game {

  Stadium stadium;
  Player player;
  Player2 player2;
  Puck puck;

  int score1, score2;
  boolean done, woop, woop2; 

  Game() {
    stadium = new Stadium();
    player = new Player();
    player2 = new Player2();
    puck = new Puck();

    done = false;
    score1 = 0;
    score2 = 0;
  }

  void run() {
    stadium.underground();
    stadium.goal(puck);
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
      score1++;
    } else if (scorer.equals("p2")) {
      score2++;
    }
  }

  boolean gamedone() { //when the character has reached the edge the intro is done
    if (score1 == 3 || score2 == 3) {
      if (score1==3) {
        woop = true;
      }
      if (score2 == 3) {
        woop2 = true;
      }
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
