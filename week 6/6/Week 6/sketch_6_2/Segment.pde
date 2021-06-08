class Segment {
  float initForce;
  float force;
  float segmentMass;
  float velocity;
  //float oldVelocity;
  float acceleration;
  float damping; 
  float angle;
  float springConst=0.3;
  PVector pos = new PVector(0,0);
  PVector temppos = new PVector(0,0);

 
  Segment() {
    //constructor for variables used in this class
    //initial values, will get changed in update
    segmentMass = 2;
    damping = 0.1; //damping speed
    initForce = 1/springConst;
    velocity = 0;
  }
 
  void update(float x, float y,float v, float f) {
    //Friction = friction * rotSpeed;
    //force = initForce + f-Friction;
    //velocity = v;
    //angle = a;
    //acceleration = force/segmentMass;
    //velocity += acceleration;
    //angle += velocity;
    //angle += friction;
    //velocity *= damping; 
    //force = initForce + f;
    //oldVelocity = v;
    //angle = a;
    //velocity += force/segmentMass;
    //velocity -= v;
    //angle += velocity;
    //angle *= 1/springConst;
    //angle += damping;
    //force -= angle;
    pos.set(width/2,height);
    temppos.set(x,y);
    force = PVector.dist(temppos,pos);
    force += f;
    force *= -springConst;
    acceleration = force/segmentMass;
    velocity = damping * (velocity+acceleration+v);
    temppos.add(velocity,0);
  }
}
