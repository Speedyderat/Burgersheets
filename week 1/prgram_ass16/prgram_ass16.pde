/* This program has been written by Jasper Bosschart (s2562685) & Marina Stefanova (s2610604), assignment 1.6 from Module 4 CreaTe 2021 */
int [] binary = {1, 1, 0, 1, 0, 1};
int power = binary.length -1;
int number = 0;

for (int i = 0; i < binary.length; i++) {
  int startingNumber = 1;
  
  for (int j = 0; j < power; j++) {
    startingNumber *= 2;
  }

power--;
startingNumber = startingNumber * binary[i];
number = number + startingNumber;
}

println(number);
