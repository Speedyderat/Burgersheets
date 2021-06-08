class Segment {
  float force, velocity, angle;
  float segmentMass;
  float spC; //spring constant
  float dampC; //dampening constant
  float friction;
  float v;
  float f;

  Segment(float f1) {
    force = f1;
    angle = PI/50;
    segmentMass = 2;
    spC = 0.2;
    dampC = 0.1;
    friction = 0.1;
  }

  void update() {
    velocity += force / segmentMass - v;
    angle += velocity;
    force = -spC*angle;
    force -= dampC * velocity;
    force += f;
    velocity*= dampC;
    v = velocity;
    f = force;
  }
}
