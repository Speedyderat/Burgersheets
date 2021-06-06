// Nature of Code 2011
// Daniel Shiffman
// Chapter 3: Oscillation

// Class to describe an anchor point that can connect to "Bob" objects via a spring
// Thank you: http://www.myphysicslab.com/spring2d.html

class Spring { 

  // Location
  PVector anchor;

  // Rest length and spring constant
  float len;
  float k = 0.2;

  // Constructor, initiallizes the anchor point and rest lenght l
  Spring(float x, float y, int l) {
    anchor = new PVector(x, y);
    len = l;
  } 

  // Calculate spring force -> our implementation of Hooke’s Law.
  void connect(Bob b) {
    // Get a Vector pointing from anchor to bob location
    PVector force = PVector.sub(b.location, anchor);
    // What is distance
    float distance = force.mag();
    // Stretch is difference between current distance and rest length   ASK  JASPER: if this "d" is distance, is the one below something else? it doenst get underlined when i change it
    float stretch = distance - len;

    // Calculate force according to Hooke's Law
    // F = k * stretch
    // k -> spring constant, stretch -> displacement of the string, calculated above 
    // Direction and magnitute together
    force.normalize(); 
    force.mult(-1 * k * stretch);
    b.applyForce(force);
  }

  // Constrain the distance between bob and anchor between min and max
  void constrainLength(Bob b, float minlen, float maxlen) {
    //vector pointing from Bob to Anchor 
    PVector dir = PVector.sub(b.location, anchor);    
    float d = dir.mag();
    // Is it too short?
    if (d < minlen) {
      dir.normalize();
      dir.mult(minlen);
      // Reset location and stop from moving (not realistic physics)
      // Keep location within constraint
      b.location = PVector.add(anchor, dir);
      b.velocity.mult(0);
      // Is it too long?
    } else if (d > maxlen) {
      dir.normalize();
      dir.mult(maxlen);
      // Reset location and stop from moving (not realistic physics)
      // Keep location within constraint
      b.location = PVector.add(anchor, dir);
      b.velocity.mult(0);
    }
  }

  // Draw the anchor
  void display() { 
    stroke(0);
    fill(175);
    strokeWeight(2);
    rectMode(CENTER);
    rect(anchor.x, anchor.y, 10, 10);
  }

  // Draw the spring connection between Bob location and anchor
  void displayLine(Bob b) {
    strokeWeight(2);
    stroke(0);
    line(b.location.x, b.location.y, anchor.x, anchor.y);
  }
}
