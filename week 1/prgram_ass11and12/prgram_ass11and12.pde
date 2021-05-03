/* This program has been written by Jasper Bosschart (s2562685) & Marina Stefanova (s2610604), assignment 1.1 from module 4 CreaTe 2021 */
char [] word = { 'H', 'E', 'L', 'L', 'O', ' ', 'H', 'O', 'M', 'E', '!'};
char [] name = {'A', 'N', 'N', 'A'};
char [] nameBackwards = reverse(name);
int startHeight, startWitdh, variableHeight, variableWitdh, counter;

void setup() {
  size(400, 400);
  startHeight = height/2;
  startWitdh = width/2;
}

void draw() {
  background(0);
  counter = 0;
  variableHeight = startHeight;
  variableWitdh = startWitdh;

  thingy1();

  variableWitdh = startWitdh;
  variableHeight = variableHeight + 20;

  thingy2();

  variableWitdh = startWitdh;
  variableHeight = variableHeight + 20;

  text(int(thingy3()), variableWitdh, variableHeight);

  counter = 0;
  variableWitdh = startWitdh;
  variableHeight = variableHeight + 20;

  if (thingy4() == true) {
    text("Bean", variableWitdh, variableHeight);
  } else {
    text("noBean", variableWitdh, variableHeight);
  }
  
  counter = 0;
  variableWitdh = startWitdh;
  variableHeight = variableHeight + 20;
}

void thingy1() {
  variableWitdh = variableWitdh - 50; 
  for (int i = 0; i < word.length; i += 1) {
    text(word[i], variableWitdh +i*10, variableHeight);
  }
}

void thingy2() {
  variableWitdh = variableWitdh + 50; 
  for (int i = word.length; i > 0; i -= 1) {
    text(word[i-1], variableWitdh -i*10, variableHeight);
  }
}

int thingy3() {
  for (int i = 0; i < word.length; i += 1) {
    if (word[i] == 'E') {
      counter = counter +1;
    }
  }
  return counter;
}

boolean thingy4() {
  for (int i = 0; i < name.length; i += 1) {
    if (name[i] == nameBackwards[i]) {
      counter=counter+1;
    }
  }
  if (counter == name.length) {
    return true;
  } else {
    return false;
  }
}
