// class created using https://openprocessing.org/sketch/975642 code by Andreas

class Player {
  PVector location, acceleration, distance;
  float sizeMain, sizeLight, sizeDark, speedWSAD;
  color main, light, dark;
  float dist;

  Player() {
    location = new PVector(width/4, height/2);
    acceleration = new PVector(0, 0);
    sizeMain = 90;
    sizeLight = 75;
    sizeDark = 40;
    speedWSAD = 10;
    main = color(185, 201, 91); 
    light = color(209, 228, 102); 
    dark = color(150, 163, 73);
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
    // Yellow player
    noStroke();
    fill (main);                            //main
    circle(location.x, location.y, sizeMain);
    fill (light);                           //lighter
    circle(location.x, location.y, sizeLight);
    fill (dark);                            //darker (f u)
    circle(location.x - 4, location.y + 4, sizeDark);
    fill (main);                            //main
    circle(location.x, location.y, sizeDark);
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

  void keysPressedEvent() {
    if (key=='w')
    {
      acceleration.y = -speedWSAD;
    }

    if (key=='s')
    {
      acceleration.y = speedWSAD;
    }

    if (key=='a')
    {
      acceleration.x = -speedWSAD;
    }

    if (key=='d')
    {
      acceleration.x = speedWSAD;
    }
  }

  void keysReleasedEvent() {
    if (key=='w' || key=='s')
    {
      acceleration.y = 0;
    }

    if (key=='a' || key=='d')
    {
      acceleration.x = 0;
    }
  }
}
