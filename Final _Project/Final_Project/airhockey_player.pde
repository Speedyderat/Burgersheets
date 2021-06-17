// class created using https://openprocessing.org/sketch/975642 code by Andreas

class Player {
  PVector location;
  float sizeMain, sizeLight, sizeDark, xSpeed, ySpeed, speedWSAD;
  color main, light, dark; 

  Player() {
    location = new PVector(width/4, height/2);
    sizeMain = 90;
    sizeLight = 75;
    sizeDark = 40;
    xSpeed = 0;
    ySpeed = 0; 
    speedWSAD = 7;
    main = color(185, 201, 91); 
    light = color(209, 228, 102); 
    dark = color(150, 163, 73);
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

  //void collision(Puck localPuck){
  //}

  void keysPressedEvent() {
    if (key=='w')
    {
      ySpeed = -speedWSAD;
    }

    if (key=='s')
    {
      ySpeed = speedWSAD;
    }

    if (key=='a')
    {
      xSpeed = -speedWSAD;
    }

    if (key=='d')
    {
      xSpeed = speedWSAD;
    }
  }

  void keysReleasedEvent() {
    if (key=='w' || key=='s')
    {
      ySpeed = 0;
    }

    if (key=='a' || key=='d')
    {
      xSpeed = 0;
    }
  }
}
