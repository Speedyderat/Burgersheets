/*This class contains everything that has to do with 
 the system that handles the particles with all their methods
 */

class ParticleSystem {
  Particle[] particles;

  ParticleSystem() { //spawn all particles in an explosion-like way in the beginning
    particles = new Particle [440];
    for (int i=0; i < particles.length; i++) {
      particles[i] = new Particle(new PVector(width/2, height/2));
    }
  }


  void update() { //make the particles come from the tip of the wand, kill them off when the lifetime is too low and make them reappear at the wand
    for (int i=0; i < particles.length; i++) {
      if (particles[i].isDead()) {
        //particles[i].lifetime= int(random(100, 255));
       // particles[i].velocity = new PVector(random(-10, 10), -10);
      }
      particles[i].update();
    }
  }


  void display() { //display every particle on it's own
    for (int i=0; i < particles.length; i++) {
      particles[i].display();
    }
  }
}
