/* This program has been written by Jasper Bosschart (s2562685) & Marina Stefanova (s2610604), assignment 1.10 from Module 4 CreaTe 2021 */

int ballCount = 500;
RedDot[] balls = new RedDot[ballCount];

void setup(){
size(500,500);
  for (int i = 0; i < ballCount; i++) {
      balls[i] = new RedDot(int(random(50, 450)),int(random(50, 450)));
  }
}

void draw(){
  for (int i = 0; i < ballCount; i++) {
  balls[i].display();
  }
}
