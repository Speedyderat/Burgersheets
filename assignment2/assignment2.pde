/* This program has been written by Jasper Bosschart (s2562685) & Marina Stefanova (s2610604), assignment 2.1 from module 4 CreaTe 2021 */
int middleWidth, middleHeight, buffer;
int diceSize= 6;
int[] counter = new int[diceSize];

void setup () {
  size(500, 500);
  middleWidth = width/2;
  middleHeight =height/2;
  textAlign(CENTER);
  textSize(69);
}
void draw () {
  background(0);
  text(buffer, middleWidth, middleHeight );
  probCounter();
  for (int i = 0; i < counter.length; i++) {
    text(counter[i], middleWidth, middleHeight+15);
  }
}

int getRandomNumber() {
  return int(random(1, (diceSize+1)));
}

void probCounter() {
  for (int i = 0; i < counter.length; i++) {
    if (buffer == i) {
      counter[i]++;
    }
  }
}

void mousePressed() {
  buffer = getRandomNumber();
}
