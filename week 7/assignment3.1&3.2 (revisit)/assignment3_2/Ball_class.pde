/* This is the ball class for the catapult game, in here the physics of the ball are described, after it has been launched by the catapult*/
class Ball {

  PVector location, velocity, gravity, friction;
  boolean release;

  Ball() {
    location = new PVector(0, 0);                                                     //some different vectors that have been used in the code are initiated here.
    velocity = new PVector(20, 0);
    gravity = new PVector(0, .4);
    release = false;
  }

  void update() {
    if (release) {                                                                    // if the ball is released all the physics come in to play making the ball drop in a "real life" way
      location.add(velocity);                                                         //velocity is added to the current location of the ball
      velocity.add(gravity);                                                          //the velocity changes over time because of added gravity
      velocity.mult(.99);                                                             //then you have a small amount of friction
      
      if ((location.x > width) || (location.x< 0)) {                                  // if the ball is outside of x-axies range it will slow down the ball and bounce back onto the canvas
        velocity.x = -velocity.x * .8;                                                //ball slows down and reverses its direction
        if (location.x > width) {                                                     //ball gets teleported a bit back into the canvas
          location.x = width;
        }  else if (location.x< 0) {                                                  //ball gets teleported a bit back into the canvas
          location.x = 0;
        }
      }
      if (location.y > height) {                                                      // if the ball reaches the bottom of the screen it can bounce back up
        if (velocity.y < 1.5) {                                                         //when the ball gets too slow, it stops moving
          velocity.y = 0;
          velocity.x = 0;
        }
        if (velocity.y > 1.5) {
          velocity.y = -velocity.y *.6;                                               //ball slows down and reverses its direction
          location.y = height;                                                        //ball gets teleported a bit back into the canvas
        }
      }
    }
  }

  void render() {                                                                     //drawing of the ball itself
    stroke(255);
    strokeWeight(2);
    fill(255, 50, 50);
    ellipse(location.x, location.y, 30, 30);
  }

  void release() {                                                                   //if ball is released then release is obviously true
    release = true;
  }
}
