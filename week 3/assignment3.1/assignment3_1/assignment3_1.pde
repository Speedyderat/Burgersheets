

Ball ball;
Catapult catapult;

void setup() {
  size(1000, 750);
  ball = new Ball(new PVector(100, 100));   // a ball gets a position initially
  catapult = new Catapult(new PVector(150, 430), ball);  // a catapult has a position and a ball it shoots
}
void draw() { 
  background(111, 179, 250);
  fill (65,82,45);
  catapult.update();
  ball.update();  
  catapult.renderBack();  
  ball.render();
  catapult.renderFront(); 
}
void mouseDragged() { //dragging the ball in the catapult
  catapult.mouseDraggedEvent(new PVector(mouseX, mouseY));
}

void mouseReleased() { // releasing the ball from the catapult
  catapult.mouseReleasedEvent();
}
