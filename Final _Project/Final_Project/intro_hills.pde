class Hills { //the continuesly moving background in intro

float xoff, yincrement1, yincrement2, yincrement3, xSpeed, start;

  Hills() {
    yincrement1 = 0.004;    //changes the sharpness or smoothness level of the mountains
    yincrement2 = 0.003;
    yincrement3 = 0.002;
    xSpeed = 0.001;
  }

  void display() {
    noStroke(); 

    //mountain 1
    fill( 251, 197, 196);

    beginShape();
    vertex(0, height);
    xoff = start;

    for (float x = 0; x < width; x++) {
      stroke(255);
      float y = map(noise(xoff) * height, 0, height, 100, 250); // location of the mountains
      vertex(x, y);
      xoff += yincrement1;
    }

    vertex(width, height);
    endShape();

    start += xSpeed;

    //mountain 2
    fill(252, 162, 139);

    beginShape();
    vertex(0, height);
    xoff = start;

    for (float x = 0; x < width; x++) {
      stroke(255);
      float y = map(noise(xoff) * height, 0, height, 300, 450); // location of the mountains
      vertex(x, y);
      xoff += yincrement2;
    }

    vertex(width, height);
    endShape();

    start += xSpeed;

    //mountain 3
    fill(250, 125, 121);

    beginShape();
    vertex(0, height);
    xoff = start;

    for (float x = 0; x < width; x++) {
      stroke(255);
      float y = map(noise(xoff) * height, 0, height, 500, 550); // location of the mountains
      vertex(x, y);
      xoff += yincrement3;
    }

    vertex(width, height);
    endShape();

    start += xSpeed;
  }
}
