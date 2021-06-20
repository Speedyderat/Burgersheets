// Flock class

// Does very little, simply manages the ArrayList of all the birds

// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Flock {
  ArrayList<Bird> birds; // An ArrayList for all the birds

  Flock() {
    birds = new ArrayList<Bird>(); // Initialize the ArrayList
  }

  void run() {
    for (Bird boid : birds) {
      boid.run(birds);  // Passing the entire list of birds to each boid individually
    }
  }

  void addBird(Bird boid) {
    birds.add(boid);
  }
}
