class Game {

  Stadium stadium;
  Player player;
  Player2 player2;
  Puck puck;

  Game() {
    stadium = new Stadium();
    player = new Player();
    player2 = new Player2();
    puck = new Puck();
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
}
