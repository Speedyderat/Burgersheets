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
  }

  void display() {
    stadium.underground();
    //goals, class stadium
    player.display();
    player2.display();
    puck.display();
    //the wall around, class stadium
    //details, maybe the railing in the middle, class stadium
  }

  boolean gamedone() { //when the character has reached the edge the intro is done

    return done;
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
