/* Topic 6, Assignment 1
 * Mass-Spring-Damper
 * By Juno Reuvers, and Lot van der Galiën
*/


Penis penis;

void setup() {
  size(640, 640);
  penis = new Penis();
}

void draw() {
  background(120, 180, 255);
  penis.update();
  penis.render();
}
