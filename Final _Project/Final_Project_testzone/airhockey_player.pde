// Player class

// handles the paddle on the left of the screen, handles movement and collision.
// class inspired by https://openprocessing.org/sketch/975642 code by Andreas

class Player {
  PVector location, acceleration, distance;
  float sizeMain, sizeLight, sizeDark, speedWSAD;
  color main, light, dark;

  Player() {
    location = new PVector(width/4, height/2);
    acceleration = new PVector(0, 0);

    sizeMain = 90;
    sizeLight = 75;
    sizeDark = 40;

    main = color(185, 201, 91); 
    light = color(209, 228, 102); 
    dark = color(150, 163, 73);

    speedWSAD = 10;
  }

  void run() {
    location.add(acceleration);                                     //acceleration is added to the current location of the puck

    //creation of the yellow paddle
    noStroke();
    fill (main);                                                    //main colored circle
    circle(location.x, location.y, sizeMain);
    fill (light);                                                   //lighter colored circle
    circle(location.x, location.y, sizeLight);
    fill (dark);                                                    //darker colored circle
    circle(location.x - 4, location.y + 4, sizeDark);
    fill (main);                                                    //main colored circle
    circle(location.x, location.y, sizeDark);
  }

  void collision(Puck puck) {                                       //handles the collision of the paddle with the puck
    distance = PVector.sub(location, puck.location);                //creates a distance vector from the middle paddle to the middle of the puck
    if (distance.mag() < sizeLight) {                               //checks of the distance vectors length is smaller then the biggest ring of the paddle to check if there is collision between the puck and the paddle
      puck.acceleration.sub(distance.mult(0.2));                    //if there is colision then the acceleration of the puck will be changed to the opposite direction of the distance vector times 0.2* (*because otherwise the speed would be too great)
    }
  }

  void keysPressedEvent() {                                         //handles input from wasd and WASD to check if the paddle needs to move and how it will move
    if (key=='w' || key=='W')
    {
      acceleration.y = -speedWSAD;
    }

    if (key=='s' || key=='S')
    {
      acceleration.y = speedWSAD;
    }

    if (key=='a' || key=='A')
    {
      acceleration.x = -speedWSAD;
    }

    if (key=='d' || key=='D')
    {
      acceleration.x = speedWSAD;
    }
  }

  void keysReleasedEvent() {                                        //checks if the keys have been released to set the movement of the paddle back to zero
    if (key=='w' || key=='s' || key=='W' || key=='S')
    {
      acceleration.y = 0;
    }

    if (key=='a' || key=='d' || key=='A' || key=='D')
    {
      acceleration.x = 0;
    }
  }
}
