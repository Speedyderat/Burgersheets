class MSD{
  float mass = 20;    //mass 
  float friction =0.4;  //friction (damping constant)
  float springConstant = 1.5;  //springconstant
  float force=10;  //initial force
  float acceleration;  //change of velocity
   float velocity=0;   // inital velocity
  float position=0; // intitial position
 
 
  void calculate(float mousePosition){
    if(mousePressed==false){
   acceleration= (force-(friction/mass)*velocity-(springConstant/mass)*(position-300));
    velocity = velocity + acceleration;
    position=position+velocity;
    }
    else{
      position=mousePosition;
    }
  } 
}
