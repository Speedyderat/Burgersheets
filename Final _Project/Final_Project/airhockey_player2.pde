// class created using https://openprocessing.org/sketch/975642 code by Andreas

class Player2 {
  PVector location;
  float sizeMain, sizeLight, sizeDark, xSpeed, ySpeed, speedWSAD;
  color main, light, dark; 

  Player2() {
    location = new PVector(width *3/4, height/2);
    sizeMain = 90;
    sizeLight = 75;
    sizeDark = 40;
    xSpeed = 0;
    ySpeed = 0; 
    speedWSAD = 25;
    main = color(113, 209, 151); 
    light = color(128, 237, 172); 
    dark = color(78, 145, 105);
  }

  void run() {
    update();
    display();
  }

  void update() {
    location.x = location.x + xSpeed;
    location.y = location.y + ySpeed;
  }

  void display() {
    // Green player 
    noStroke();
    fill (main);                              //main
    circle(location.x, location.y, 90);  
    fill (light);                             //lighter
    circle(location.x, location.y, 75);
    fill (dark);                               //darker
    circle(location.x + 4, location.y + 4, 40);
    fill (main);                             //main
    circle(location.x, location.y, 40);
  }

  void keysPressedEvent() {
    if (key==CODED)
    {
      if (keyCode==UP)
      {
        ySpeed = -speedWSAD;
      }

      if (keyCode==DOWN)
      {
        ySpeed = speedWSAD;
      }

      if (keyCode==LEFT)
      {
        xSpeed = -speedWSAD;
      }

      if (keyCode==RIGHT)
      {
        xSpeed = speedWSAD;
      }
    }
  }

  void keysReleasedEvent() {
    if (key==CODED)
    {
      if (keyCode==UP || keyCode==DOWN)
      {
        ySpeed = 0;
      }

      if (keyCode==LEFT || keyCode==RIGHT)
      {
        xSpeed = 0;
      }
    }
  }

  void collision(Puck puck) {
    {
      float distance = dist( location.x, location.y, puck.location.x, puck.location.y);
      if (distance < 35)
      {
        float dx = location.x -puck.location.x;
        float dy = location.y -puck.location.y;
        puck.acceleration.x = -dx*0.2;
        puck.acceleration.y = -dy*0.2;
      }
    }
  }
}
