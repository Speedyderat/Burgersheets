class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin, mouse;
  import java.util.Iterator;
  boolean click;

  ParticleSystem() {
    particles = new ArrayList<Particle>();
  }



  void addParticle() {
    particles.add(new Particle(new PVector (random (width), 255)));
  }

  void run() {
    Iterator<Particle> it =
      particles.iterator();
    while (it.hasNext()) {
      Particle p = it.next();
      p.run();
      if (p.isDead()) {
        it.remove();
      }
    }
  }

  void mouseDraggedEvent (PVector mouseLocation) {
    mouse = mouseLocation; 
    click = true; 
    mouse.y = 0;
  }
}
