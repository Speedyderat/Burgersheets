/* system for the particles giving them a location and making them appear when the mouse is being clicked/dragged */
class ParticleSystem {

  ArrayList<Particle> particles;
  PVector origin, mouse;
  boolean click;
  import java.util.Iterator;                                                      // Import the class of Iterator

  ParticleSystem(PVector location) {
    origin = location.copy();                                                     //point of origin where each Particle begins
    particles = new ArrayList<Particle>();
  }

  void addParticle() {                                                            //when the mouse is clicked then add a particle
    if (click == true) {
      particles.add(new Particle(mouse));
    }
  }

  void run() {
    Iterator<Particle> it = particles.iterator();                                 //remove the particle from the array when it is not "alive" anymore
    while (it.hasNext()) {
      Particle p = it.next();
      p.run();
      if (p.isDead()) {
        it.remove();
      }
    }
  }

  void mouseDraggedEvent(PVector mouseLocation) {                                 //when the ball is being dragged the ball is in state one
    mouse = mouseLocation;                                                        //the location of the mouse is passed through to "mouse"
    click = true;                                                                 //if mouse is clicked/dragged then click is true
  }

  void mouseReleasedEvent() {                                                     //if mouse is released then click is false
    click = false;
  }
}
