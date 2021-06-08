class Segment {
  float force, velocity, angle;
  float segmentMass;
  float spC; //spring constant
  float dampC; //dampening constant
  float friction;

  Segment(float f1) {
    force = f1;
    angle = PI/50;
    segmentMass = 2;
    spC = 0.3;
    dampC = 0.1;
    friction = 0.6;
  }
  void wind(float f2){
    force = f2;
  }

  void update(float v, float f) {
    velocity += force / segmentMass - v;
    angle += velocity;
    force = -spC*angle;
    force -= dampC * velocity;
    force += f;
    velocity*= dampC;
  }
}
