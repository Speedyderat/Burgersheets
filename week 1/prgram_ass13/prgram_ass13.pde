/* This program has been written by Jasper Bosschart (s2562685) & Marina Stefanova (s2610604), assignment 1.3 from Module 4 CreaTe 2021 */

int numberCount = 500;
int[] numbers = new int[numberCount];
int counter = 0;

for (int i=0; i<numberCount; i++) {                                                                                  
  numbers[i] = int(random(100));
  if (numbers[i] > 50) {
    counter++;
  }
}
println("there are " +counter+ " numbers bigger then 50 in this array.");
