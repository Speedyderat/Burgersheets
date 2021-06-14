/* This program has been written by Jasper Bosschart (s2562685) & Marina Stefanova (s2610604), assignment 3 from module 4 CreaTe 2021 */

Game game;

void setup() {
  size(1000, 750);
  game = new Game();
}

void draw() {

  game.display();
}

void mouseDragged() {                                                              //dragging the ball in the catapult
  game.mouseDraggedEvent(new PVector(mouseX, mouseY));
}

void mouseReleased() {                                                             // releasing the ball from the catapult
  game.mouseReleasedEvent();
}
