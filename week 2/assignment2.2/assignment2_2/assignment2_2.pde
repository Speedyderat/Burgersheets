/* This program has been written by Jasper Bosschart (s2562685) & Marina Stefanova (s2610604), assignment 2.2 from module 4 CreaTe 2021 */
int diceSize= 6;

void setup () {
  size(100, 100);
}

void draw() {
}

void mouseClicked() {
  float burger = 0.8; 
  float sheets = random(1);

  if (sheets < burger) {
    println(6);
  } else {
    println(int(random(1, (diceSize+1))));
  }
}
