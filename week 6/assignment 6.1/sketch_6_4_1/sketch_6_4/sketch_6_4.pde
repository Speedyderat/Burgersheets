// Twan Nijhuis s2304619
// Gijs Kampshoff s2307200
//    22/06/2020

MSD msd;
void setup() {
  size(400, 1000);
  msd = new MSD();
}

void draw() {
  background(0);
  msd.calculate(mouseY);
  stroke(255);
  line(width/2, 20, width/2, msd.position);
  rectMode(CENTER);
  rect(width/2, msd.position, 40, 40);
}
