class Game {

  Stadium stadium;
  Player player, player2;

  Game() {
    stadium = new Stadium();
    player = new Player();
    player2 = new Player();
  }

  void run() {
  }
  void display() {
    stadium.underground();
    //goals, class stadium
    //puck, class puck
    //the thingies you have in your hand, class p1/p2
    //the wall around, class stadium
    //details, maybe the railing in the middle, class stadium
  }
}
