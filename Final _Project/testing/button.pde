/* system for the particles giving them a location and making them appear when the mouse is being clicked/dragged */
class ParticleSystem {

  ArrayList<Particle> particles;
  PVector origin, mouse, location;
  boolean click;
  import java.util.Iterator;  
  float x,y;
  // Import the class of Iterator

  ParticleSystem() {
    //origin = new PVector(random(width), random(height));      //point of origin where each Particle begins
    location = new PVector(random(width), random(height)); 
    particles = new ArrayList<Particle>();
 
  }

  void addParticle() {                                                            //when the mouse is clicked then add a particle
    if (click == true) {
      particles.add(new Particle(location));
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
    click = true;    
    mouse.y = 0;        //if mouse is clicked/dragged then click is true
  }

}
