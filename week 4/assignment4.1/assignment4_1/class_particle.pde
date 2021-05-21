class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan; //A new variable to keep track of how long the particle has been “alive”
 
  Particle(PVector l) {
    location = l.get();
    acceleration = new PVector();
    velocity = new PVector();
    lifespan = 255; //We start at 255 and count down for convenience
  }
 
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 2.0; //Lifespan decreases
  }
 
  void display() {
    stroke(0,lifespan); //Since our life ranges from 255 to 0 we can use it for alpha
    fill(175,lifespan);
    ellipse(location.x,location.y,8,8);
  }
}
