/* This program has been written by Jasper Bosschart (s2562685) & Marina Stefanova (s2610604), assignment 2.1 from module 4 CreaTe 2021 */
int middleWidth, middleHeight, buffer;
int diceSize= 4;
int[] numbers = new int[diceSize+1];

void setup () {
  for (int i = 0; i < 10000; i++) {
    buffer = int(random(1, (diceSize+1)));
    for (int j = 0; j < numbers.length; j++) {
      if (buffer == j) {
        numbers[j]++;
      }
    }
  }
      println(numbers);
}
