class Wand {
  PVector mouse;

  Wand() {
    mouse = new PVector(0,0);
  }

  void display() {
        stroke(0, 255);
    fill(0, 255);
    rect(mouse.x, mouse.y, 10, 50);
  }
  
  void mouseMovedEvent(PVector mouse) {
    this.mouse = mouse;
  }
}
