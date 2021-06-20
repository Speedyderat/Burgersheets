class ParticleSystem { //<>// //<>//
  Particle[] particles;

  ParticleSystem() {                                                 //explosion behaviour sarter
    particles = new Particle [440];
    for (int i=0; i < particles.length; i++) {
      particles[i] = new Particle(new PVector(width/2, height/2));
    }
  }


  void update() {                                                    //explosion
    for (int i=0; i < particles.length; i++) {
      if (particles[i].isDead()) {
        particles[i].lifespan= int(random(100, 255));
        particles[i].velocity = new PVector(random(-10, 10), -10);
      }
      particles[i].update();
    }
  }

  void display() {                                                   //display particles individually
    for (int i=0; i < particles.length; i++) {
      particles[i].display();
    }
  }
}
