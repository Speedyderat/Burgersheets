class RedDot {
  int xPos, yPos;

  RedDot (int x, int y) {
    xPos = x;
    yPos = y;
  }
  void display() {
    fill(255, 0, 0);
    ellipse(xPos, yPos, 50, 50);
  }
}
