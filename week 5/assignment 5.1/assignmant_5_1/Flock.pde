// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Flock class
// Does very little, simply manages the ArrayList of all the boids

class Flock {
  ArrayList<Boid> boids; // An ArrayList for all the boids

  Flock() {
    boids = new ArrayList<Boid>(); // Initialize the ArrayList
  }

  void run() {
    for (Boid boid : boids) {
      boid.run(boids, obstacle);  // Passing the entire list of boids to each boid individually
    }
  }

  void addBoid(Boid boid) {
    boids.add(boid);
  }
}
