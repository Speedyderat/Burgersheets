/*This program has been made by Ahmed Mahran and Ferdy Sloot and has been finished on 5/25/2021
 This program has been made for topic 4, exersice 1. The program consists of a wand, particle and particle system class. 
 The program makes particles appear out of the wand, when the particles die off (opacity-wise), they reappear at the tip of the wand as new ones.
 */

ParticleSystem particlesystem;

void setup() {
  size(900, 900);
  particlesystem = new ParticleSystem();
}


void draw() {
  background(255);
  particlesystem.display(); //display particles
  particlesystem.update(); //update system that handles particles
}
