//Annabelle de Ruiter and Senna Claes
//With help from Ard Kotte, Babet ten Hagen, Sarah Janssen and Konrad Rempe

Flower power;
PVector origin;

void setup() {
  size(1000, 750);
  origin = new PVector(width/2, height);
  power = new Flower(origin);
  
    origin = new PVector(random(25, width-25), height);
    power = new Flower(origin);
  }


void draw() {
  frameRate(60);
  background(100, 199, 255);
  power.update();
  power.display();
  
    power.update();
    //power.updateWind();
    power.display();
  
}
