///* class for the wand that follows the mouse everywhere it moves */
//class Wand {
//  PVector mouse;

//  Wand() {                                                         //creating a vector named mouse
//    mouse = new PVector(0, 0);
//  }

//  void display() {                                                 //making the wand look like it does on the canvas and rotating it to give it a more wand like feel
//    stroke(0, 255);
//    fill(0, 255);
//    pushMatrix();
//    translate(mouse.x, mouse.y);
//    rotate(PI/4.5);
//    rect(-5, 0, 5, 50);
//    popMatrix();
//  }

//  void mouseMovedEvent(PVector mouse) {                           //giving the vector mouse the actual location of the mouse at all time
//    this.mouse = mouse;
//  }
//}
