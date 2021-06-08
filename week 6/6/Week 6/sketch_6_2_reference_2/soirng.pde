class Spring { 
 PVector pos = new PVector (0,0);
  PVector temppos = new PVector(0,0);
 PVector origin = new PVector(0,0);
   // Spring simulation constants 
  float mass;       // Mass 
  float k = 0.2;    // Spring constant 
  float damp;       // Damping 
  float rest_posx;  // Rest position X 
  float rest_posy;  // Rest position Y 
 
  float velx = 0.0;   // X Velocity 
  float vely = 0.0;   // Y Velocity 
  float accel = 0;    // Acceleration 
  float force = 0;    // Force 
 
  Spring[] friends;
  int me;
 
  // Constructor
  Spring(float x, float y, int s, float d, float m, 
    float k_in, Spring[] others, int id) { 
    pos.x = temppos.x = x; 
    pos.x = temppos.y = y;
    rest_posx = x;
    rest_posy = y;
    size = s;
    damp = d; 
    mass = m; 
    k = k_in;
    friends = others;
    me = id;
  } 
 
  void update() { 
    rest_posy = height-200; 
    rest_posx = 300;
 
    force = -k * (temppos.y - rest_posy);  // f=-ky 
    accel = force / mass;                 // Set the acceleration, f=ma == a=f/m 
    vely = damp * (vely + accel);         // Set the velocity 
    temppos.y = temppos.y + vely;           // Updated position 
 
    force = -k * (temppos.x - rest_posx);  // f=-ky 
    accel = force / mass;                 // Set the acceleration, f=ma == a=f/m 
    velx = damp * (velx + accel);         // Set the velocity 
    temppos.x = temppos.x + velx;           // Updated position
  } 
 
 
 
  void display() { 
    strokeWeight(10);
    stroke(255);
    line(rest_posx ,height , temppos.x, temppos.y);
 
 
  }}
