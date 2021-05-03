class Milo {

  //declaring variables
  float miloRadius;
  PVector position, speed;

  //specific color range (pastel)
  float r;
  float g;
  float b;

  //making each creature part have a color variable
  color body; 
  color hat; 
  color eyes;
  color head;

  //for the movement of the creature
  boolean isSelected;

  //Milo constructor 
  Milo () {

    position = new PVector(500, 500);
    speed = new PVector(random (-3, 3), random (-3, 3));

    miloRadius = 80;

    isSelected = false;

    r = random(210, 240);
    g = random(210, 240);
    b = random(210, 240);

    body = color(245, 230, 130);
    hat  = color(random(r), random(g), random(b));
    eyes = color(155, 155, 155); 
    head = color(175, 224, 230);
  }

  //displaying my creature
  void display()
  {
    // arms 
    line(position.x-40, position.y+50, position.x-55, position.y+55);
    line(position.x+40, position.y+50, position.x+55, position.y+55);

    noFill();
    arc(position.x-75, position.y+55, 10, 10, -HALF_PI, HALF_PI);
    arc(position.x+75, position.y+55, 10, 10, PI-HALF_PI, PI+HALF_PI);

    line(position.x-55, position.y+55, position.x-70, position.y+55);
    line(position.x+55, position.y+55, position.x+70, position.y+55);

    //legs
    line(position.x-10, position.y+100, position.x-10, position.y+120);
    line(position.x+10, position.y+100, position.x+10, position.y+120);

    line(position.x-10, position.y+120, position.x-20, position.y+120);
    line(position.x+10, position.y+120, position.x+20, position.y+120);

    //draw milo's body
    //left elipse
    strokeWeight(2);
    pushMatrix();
    translate(position.x-(39/2), position.y+35+(40/3));
    rotate(PI/6);
    stroke(0);
    fill(body);
    ellipse(0, 0, 120/3, 100);
    popMatrix();

    //right elipse
    pushMatrix();
    translate(position.x+(39/2), position.y+35+(40/3));
    rotate(-PI/6);
    stroke(0);
    fill(body);
    ellipse(0, 0, 120/3, 100);
    popMatrix();

    //bottom ellipse
    pushMatrix();
    translate(position.x, position.y+80);
    rotate(PI/2);
    stroke(0);
    fill(body);
    ellipse(0, 0, 120/3, 100);
    popMatrix();   

    //fill in gaps
    pushMatrix();
    stroke(body);
    fill(body);
    circle(position.x, position.y+60, 60); 
    circle(position.x+22, position.y+71, 48); 
    circle(position.x-22, position.y+71, 48); 
    circle(position.x+42, position.y+74, 10);
    circle(position.x-42, position.y+74, 10); 
    popMatrix();

    //hat
    fill(hat);
    stroke(0);
    ellipse(position.x, position.y-90, 40, 35);

    //head 
    stroke(0);
    fill(head);
    circle(position.x, position.y-30, 120);

    //eyes 
    fill(eyes);
    ellipse(position.x+34, position.y-28, 50, 60);
    ellipse(position.x-34, position.y-28, 50, 60);

    //mouth 
    stroke(0);
    fill(0);
    arc(position.x, position.y, 15, 15, 0, PI);

    //adding movement
    position.add(speed);

    //bouncing off the edjes
    if ((position.x > width - 80 && speed.x > 0) || (position.x < 80 && speed.x < 0)) {
      speed.x = -speed.x;
    }
    if ((position.y > width - 120 && speed.y > 0) || (position.y < 120 && speed.y < 0)) {
      speed.y = -speed.y;
    }
  }

  //milo overlaps, therefore this is code for bouncing off each other
  //code was found on https://forum.processing.org/two/discussion/24966/bouncing-balls-collision -> and was adapted to fit my code
  void overlaps(Milo a) {
    float d = dist(position.x, position.y, a.position.x, a.position.y);
    if (d <= miloRadius + a.miloRadius) {
      //the if... and -abs or abs is to decide on which side the bounce will ocure. one wills tay the same whereas the other will change direction into the opposite hence bounce
      if (position.x < a.position.x) {
        speed.x = -abs(speed.x);
      }
      if (position.x > a.position.x) {
        speed.x = abs(speed.x);
      }
      if (position.y < a.position.y) {
        speed.y = -abs(speed.y);
      }
      if (position.y > a.position.y) {
        speed.y = abs(speed.y);
      }
    }
  }

  //when mouse is pressed or dragged the creature will stop moving and can be dragged around the screen. When it is released it will continue to move from that point
  //mousepressed
  void Milopressed(float mx, float my) {
    if (dist(position.x, position.y, mx, my) <= miloRadius) {
      speed.x = 0;
      speed.y = 0;
      isSelected = true;
    }
  }
  //mousereleased
  void Miloreleased(float mx, float my, float pmx, float pmy) {
    if (isSelected) {
      speed.x = mx - pmx;
      speed.y = my - pmy;
      isSelected = false;
    }
  }
  //mousedragged
  void Milodragged(float mx, float my) {
    if (isSelected) {
      position.x = mx;
      position.y = my;
    }
  }

  //when the mouse is moved around the screen, the color of the eyes will change to random colors
  //mousemoved
  void Milomoved (float mx, float my) {
    if (dist(position.x, position.y, mx, my) <= miloRadius) { 
      eyes = color (random(r), random(g), random(b));
    }
  }
}
