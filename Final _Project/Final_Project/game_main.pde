//The Air Hockey game

//The game starts of with player 1 and player 2, both need to be moved by players because we did not have the time to realize an actual robot to play against. 
//First off, the puck needs to be shot from the middle by any of the two players, this has been done with knowledge from the catapult assignment. 
//Because the mouse can be operated by both players the responsibility is by the players themselves to discuss who gets to shoot. 
//After this the game can begin and by use of the WASD and arrow keys both players can move their paddels and try to get the puck in the goals on either side of the screen. 
//Physics are used to make the interaction between the paddles and puck happen. The score gets registered and the first player to score 3 goals wins. 
//After which the outro screen comes up.

class Game {

  Stadium stadium;
  Player player;
  Player2 player2;
  Puck puck;

  int score1, score2;
  boolean done, woop, woop2, score; 

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
    score("display");
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

  void score (String scorer) { //class that handles all the scoring related events, We have used strings to have easier to use and read variables at the expense of a bit more memory usage
    if (scorer.equals("p1")) {                              //if the input equals p1, then the score for player1 goes up by 1
      score1++;
    } else if (scorer.equals("p2")) {                       //if the input equals p1, then the score for player2 goes up by 1
      score2++;
    } else if (scorer.equals("display")) {                  //if the input equals display, then the score will be displayed
      textSize(25);
      textAlign(CENTER);
      text("p1 " + score1 + "  p2 " + score2, width/2, 30);
    } else if (scorer.equals("score")) {                    //if the input equals score, then the score will be displayed
      score = true;
    }
    score = false;
  }

  boolean gamedone() {                                      //when one of the players has scroed 3 points the game is done
    if ((score1 == 3 || score2 == 3)) {
      if (score1==3) {
        woop = true;                                       // if woop is true then in the outro screen player 1 is the winner 
      }
      if (score2 == 3) {
        woop2 = true;                                      // if woop2 is true then in the outro screen player 2 is the winner 
      }
      return true;
    } else {
      return false;
    }
  }

  void mouseDraggedEvent(PVector mouseLocation) {          // handles the mouse dragged event from puck
    puck.mouseDraggedEvent(mouseLocation);
  }

  void mouseReleasedEvent() {                              // handles the mouse released event from puck
    puck.mouseReleasedEvent();
  }

  void keyPressedEvent() {                                 // handles the key pressed events from the player classes 
    player.keysPressedEvent();
    player2.keysPressedEvent();
  }

  void keysReleasedEvent() {                               // handles the key released events from the player classes 
    player.keysReleasedEvent();
    player2.keysReleasedEvent();
  }
}
