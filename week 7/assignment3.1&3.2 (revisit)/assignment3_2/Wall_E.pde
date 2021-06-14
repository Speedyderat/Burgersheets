class Wall {

  Ball ball;

  Wall(Ball ball) {
    this.ball = ball;
  }
  void update() {
    if ((ball.location.x > width) || (ball.location.x< 0)) {                                  // if the ball is outside of x-axies range it will slow down the ball and bounce back onto the canvas
      ball.velocity.x = -ball.velocity.x * .8;                                                //ball slows down and reverses its direction
      if (ball.location.x > width) {                                                     //ball gets teleported a bit back into the canvas
        ball.location.x = width;
      } else if (ball.location.x< 0) {                                                  //ball gets teleported a bit back into the canvas
        ball.location.x = 0;
      }
    }
    if (ball.location.y > height) {                                                      // if the ball reaches the bottom of the screen it can bounce back up
      if (ball.velocity.y < 1.5) {                                                       //when the ball gets too slow, it stops moving
        ball.velocity.y = 0;
        ball.velocity.x = 0;
      }
      if (ball.velocity.y > 1.5) {
        ball.velocity.y = -ball.velocity.y *.6;                                               //ball slows down and reverses its direction
        ball.location.y = height;                                                        //ball gets teleported a bit back into the canvas
      }
    }
  }

  void display() {
  }
}
