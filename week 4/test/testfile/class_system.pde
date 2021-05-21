class ParticleSystem {

  ArrayList<Particle> particles;
  // This particular ParticleSystem implementation
  // includes an origin point where each Particle begins.
  PVector origin, mouse;
  boolean click;
  import java.util.Iterator;  // Import the class of Iterator

  ParticleSystem(PVector location) {
    origin = location.copy();
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    if (click == true) {
      particles.add(new Particle(mouse));
    }
  }

  void run() {
    Iterator<Particle> it = particles.iterator();
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
    click = true;
  }

  void mouseReleasedEvent() {                                                     //if ball is released then release is obviously true
    click = false;
  }
}
