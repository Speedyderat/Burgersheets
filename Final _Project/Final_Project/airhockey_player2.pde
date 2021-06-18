// class created using https://openprocessing.org/sketch/975642 code by Andreas

class Player2 {
  PVector location, acceleration, distance;
  float sizeMain, sizeLight, sizeDark, speedWSAD;
  color main, light, dark; 

  Player2() {
    location = new PVector(width *3/4, height/2);
    acceleration = new PVector(0, 0);
    sizeMain = 90;
    sizeLight = 75;
    sizeDark = 40;
    speedWSAD = 10;
    main = color(113, 209, 151); 
    light = color(128, 237, 172); 
    dark = color(78, 145, 105);
  }

  void run() {
    update();
    display();
  }

  void update() {
    location.x = location.x + acceleration.x;
    location.y = location.y + acceleration.y;
  }

  void display() {
    // Green player 
    noStroke();
    fill (main);                              //main
    circle(location.x, location.y, 90);  
    fill (light);                             //lighter
    circle(location.x, location.y, 75);
    fill (dark);                              //darker
    circle(location.x + 4, location.y + 4, 40);
    fill (main);                             //main
    circle(location.x, location.y, 40);
  }

  void collision(Puck puck) {
    {
      distance = PVector.sub(location, puck.location);
      if (distance.mag() < sizeLight)
      {
        puck.acceleration.sub(distance.mult(0.2));
      }
    }
  }

  //void collision(Puck puck) {
  //  {
  //    float distance = dist( location.x, location.y, puck.location.x, puck.location.y);
  //    if (distance < 35)
  //    {
  //      float dx = location.x -puck.location.x;
  //      float dy = location.y -puck.location.y;
  //      puck.acceleration.x = -dx*0.2;
  //      puck.acceleration.y = -dy*0.2;
  //    }
  //  }
  //}

  void keysPressedEvent() {
    if (key==CODED)
    {
      if (keyCode==UP)
      {
        acceleration.y = -speedWSAD;
      }

      if (keyCode==DOWN)
      {
        acceleration.y = speedWSAD;
      }

      if (keyCode==LEFT)
      {
        acceleration.x = -speedWSAD;
      }

      if (keyCode==RIGHT)
      {
        acceleration.x = speedWSAD;
      }
    }
  }

  void keysReleasedEvent() {
    if (key==CODED)
    {
      if (keyCode==UP || keyCode==DOWN)
      {
        acceleration.y = 0;
      }

      if (keyCode==LEFT || keyCode==RIGHT)
      {
        acceleration.x = 0;
      }
    }
  }
}
