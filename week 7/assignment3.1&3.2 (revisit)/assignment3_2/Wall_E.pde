/* This is the objects class, in here the objects are described and how they interact with the ball ( in this case with objects we mean the borders of the world and the wall) */

class Objects {

  Ball ball;
  PVector wallLoc, pole;
  boolean pass, bounce;

  Objects(PVector wallLoc, Ball ball) {
    this.ball = ball;
    this.wallLoc = wallLoc;
    pole = new PVector(10,400);
    pass = false;
    bounce = false;
  }
  void update() {
    borders();
    wallcontact();
  }

  void display() {
    wall();
  }

  void wall() {
    noStroke();
    if (bounce) {
      fill(255, 0, 0);
    } else {
      fill(255);
    }
    rect(wallLoc.x, wallLoc.y, pole.x, -pole.y);
  }

  void wallcontact() {
    if (!bounce && !pass && (ball.location.x > wallLoc.x) && (ball.location.y > wallLoc.y-pole.y)) {                                               //if ball comes from the left side and bounces on the front of the pole
      bounce = true;
      ball.location.x = wallLoc.x;
      ball.velocity.x = -ball.velocity.x * .8;                                           //ball slows down and reverses its direction
    } else if ((ball.location.x > wallLoc.x - pole.x*2) && (ball.location.y < wallLoc.y-pole.y)) {                                                 //if comes from the left side and passes over the pole
      pass = true;                                                                       //ball has passed the pole
    } else if (!bounce && pass && (ball.location.x < wallLoc.x + pole.x*2) && (ball.location.y > wallLoc.y-pole.y)) {                              //if ball comes from the right side and bounces on the back of the pole
      bounce = true;
      ball.location.x = wallLoc.x + 20;
      ball.velocity.x = -ball.velocity.x * .8;                                           //ball slows down and reverses its direction
    } else if (ball.location.x < wallLoc.x -20) {                                                                                                  //if ball is on the left of the pole 
      pass = false;                                                                      //ball has not passed the pole
    }
  }

  void borders() {
    if ((ball.location.x > width) || (ball.location.x< 0)) {                             // if the ball is outside of x-axies range it will slow down the ball and bounce back onto the canvas
      ball.velocity.x = -ball.velocity.x * .8;                                           //ball slows down and reverses its direction
      if (ball.location.x > width) {                                                     //ball gets teleported a bit back into the canvas
        ball.location.x = width;
      } else if (ball.location.x< 0) {                                                   //ball gets teleported a bit back into the canvas
        ball.location.x = 0;
      }
    }
    if (ball.location.y > height) {                                                      // if the ball reaches the bottom of the screen it can bounce back up
      if (ball.velocity.y < 1.5) {                                                       //when the ball gets too slow, it stops moving
        ball.velocity.y = 0;
        ball.velocity.x = 0;
      }
      if (ball.velocity.y > 1.5) {
        ball.velocity.y = -ball.velocity.y *.6;                                          //ball slows down and reverses its direction
        ball.location.y = height;                                                        //ball gets teleported a bit back into the canvas
      }
    }
  }
}
