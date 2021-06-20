//background class

//This class handles the continuesly moving background in intro, including a set of birds flying around in there.

// Class created using the following sources: 
// Graphing 1D Perlin Noise (1D Noise Graph)
// https://youtu.be/y7sgcFhk6ZM
// The Coding Train / Daniel Shiffman
// https://thecodingtrain.com/learning/noise/0.4-graphing-1d.html

class Background { 
  Flock flock;
  float xoff, yincrement1, yincrement2, yincrement3, xSpeed, start;

  Background() {
    yincrement1 = 0.004;                                               //changes the sharpness or smoothness level of the mountains
    yincrement2 = 0.003;
    yincrement3 = 0.002;
    xSpeed = 0.001;

    flock = new Flock();                                              // Add an initial set of birds into the system
    for (int i = 0; i < 10; i++) {
      Bird bird = new Bird(width/2, height/2);
      flock.addBird(bird);
    }
  }

  void hills() {
    noStroke(); 

    //mountain 1, big increments therefore sharper mountains, creates a more realistic illusion 
    fill( 251, 197, 196);

    beginShape();
    vertex(0, height);
    xoff = start;

    for (float x = 0; x < width; x++) {
      stroke(255);
      float y = map(noise(xoff) * height, 0, height, 100, 250);        // location of the mountains
      vertex(x, y);
      xoff += yincrement1;
    }

    vertex(width, height);
    endShape();

    start += xSpeed;

    flock.run();                                                       // adding the bird flock here because then it hides in the mountains anf creates a realistic illusion of distance 

    //mountain 2, smaller increments therefore smoother mountains, creates a more realistic illusion 
    fill(252, 162, 139);

    beginShape();
    vertex(0, height);
    xoff = start;

    for (float x = 0; x < width; x++) {
      stroke(255);
      float y = map(noise(xoff) * height, 0, height, 300, 450);       // location of the mountains
      vertex(x, y);
      xoff += yincrement2;
    }

    vertex(width, height);
    endShape();

    start += xSpeed;

    //mountain 3, very small increments therefore almost flat mountains, creates a more realistic illusion 
    fill(250, 125, 121);

    beginShape();
    vertex(0, height);
    xoff = start;

    for (float x = 0; x < width; x++) {
      stroke(255);
      float y = map(noise(xoff) * height, 0, height, 500, 550);         // location of the mountains
      vertex(x, y);
      xoff += yincrement3;
    }

    vertex(width, height);
    endShape();

    start += xSpeed;
  }
}
