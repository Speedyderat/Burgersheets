/* 
 overlap() takes in two polygons and using the separating axis theorum returns 
 the smallest vector that will projected ob1 from colliding ob2
 if there is no collision, a null vector is returned
 Based off N Tutorial A - Collision Detection and Response
 http://www.metanetsoftware.com/technique/tutorialA.html
 And also Advanced Character Physics by Thomas Jakobsen
 */

PVector overlap(Poly ob1, Poly ob2) { //ob1 is one that is projected (moves)

  PVector nor, pt, projection;
  float low1, high1, low2, high2, dt;  
  projection = new PVector(Float.MAX_VALUE, 0);

  for ( int q = 0; q < ob1.points.size(); q++ ) {
    if ( q == (ob1.points.size()-1) ) {
      nor = PVector.sub((PVector)ob1.points.get(0), (PVector)ob1.points.get(q));
    } else {
      nor = PVector.sub((PVector)ob1.points.get(q), (PVector)ob1.points.get(q+1));
    }
    nor.set(-nor.y, nor.x, 0); //rotate 90 degrees
    nor.normalize();

    //set the values so any value will work
    low1 = Float.MAX_VALUE;
    high1 = -Float.MAX_VALUE;
    for ( int i = 0; i < ob1.points.size(); i++ ) {
      pt = PVector.add( (PVector)ob1.points.get(i), new PVector(ob1.x, ob1.y) );
      dt = pt.dot(nor);
      if ( dt < low1 ) { 
        low1 = dt;
      }
      if ( dt > high1 ) { 
        high1 = dt;
      }
    }
    low2 = Float.MAX_VALUE;
    high2 = -Float.MAX_VALUE;
    for ( int i = 0; i < ob2.points.size(); i++ ) {
      pt = PVector.add( (PVector)ob2.points.get(i), new PVector(ob2.x, ob2.y) );
      dt = pt.dot(nor);
      if ( dt < low2 ) { 
        low2 = dt;
      }
      if ( dt > high2 ) { 
        high2 = dt;
      }
    }
    //find projection using min overlap of low1-high1 and low2-high2
    //ob1 is the one that is projected (moves)
    float mid1, mid2;
    mid1 = 0.5f*(low1+high1);
    mid2 = 0.5f*(low2+high2);
    if ( mid1 < mid2 ) {
      if ( high1 < low2 ) { //no overlap
        return (new PVector(0, 0)); //return a null vector
      } else { //test to see if projection is smallest
        if ( (high1-low2) < projection.mag() ) { //new smallest projection found
          projection = nor.get();
          projection.normalize();
          projection.mult(-(high1-low2));
        }
      }
    } else {
      if ( low1 > high2 ) { //no overlap
        return (new PVector(0, 0)); //return a null vector
      } else {
        if ( (high2-low1) < projection.mag() ) { //new smallest projection found
          projection = nor.get();
          projection.normalize();
          projection.mult((high2-low1));
        }
      }
    }
  }

  //do same for ob2/////////////////////////////////////////////////////////////////////////////
  for ( int q = 0; q < ob2.points.size(); q++ ) {
    //println(ob1.points.size());
    if ( q == (ob2.points.size()-1) ) {
      nor = PVector.sub((PVector)ob2.points.get(0), (PVector)ob2.points.get(q));
    } else {
      nor = PVector.sub((PVector)ob2.points.get(q), (PVector)ob2.points.get(q+1));
    }
    nor.set(-nor.y, nor.x, 0); //rotate 90 degrees
    nor.normalize();
    nor.mult(100);
    nor.normalize();
    //set the values so any value will work
    low1 = Float.MAX_VALUE;
    high1 = -Float.MAX_VALUE;
    for ( int i = 0; i < ob1.points.size(); i++ ) {
      pt = PVector.add( (PVector)ob1.points.get(i), new PVector(ob1.x, ob1.y) );
      dt = pt.dot(nor);
      if ( dt < low1 ) { 
        low1 = dt;
      }
      if ( dt > high1 ) { 
        high1 = dt;
      }
    }
    low2 = Float.MAX_VALUE;
    high2 = -Float.MAX_VALUE;
    for ( int i = 0; i < ob2.points.size(); i++ ) {
      pt = PVector.add( (PVector)ob2.points.get(i), new PVector(ob2.x, ob2.y) );
      dt = pt.dot(nor);
      if ( dt < low2 ) { 
        low2 = dt;
      }
      if ( dt > high2 ) { 
        high2 = dt;
      }
    }
    //find projection using min overlap of low1-high1 and low2-high2
    //ob1 is the one that is projected (moves)
    float mid1, mid2;
    mid1 = 0.5f*(low1+high1);
    mid2 = 0.5f*(low2+high2);
    if ( mid1 < mid2 ) {
      if ( high1 < low2 ) { //no overlap
        return (new PVector(0, 0)); //return a null vector
      } else { //test to see if projection is smallest
        if ( (high1-low2) < projection.mag() ) { //new smallest projection found
          projection = nor.get();
          projection.normalize();
          projection.mult(-(high1-low2));
        }
      }
    } else {
      if ( low1 > high2 ) { //no overlap
        return (new PVector(0, 0)); //return a null vector
      } else {
        if ( (high2-low1) < projection.mag() ) { //new smallest projection found
          projection = nor.get();
          projection.normalize();
          projection.mult((high2-low1));
        }
      }
    }
  }

  return projection;
}
