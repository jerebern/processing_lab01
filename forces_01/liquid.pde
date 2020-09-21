// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Liquid class 
class Liquid {


  // Liquid is a rectangle
  float x, y, w, h;
  // Coefficient of drag
  float c;
  float coefficientFriction;

  Liquid(float x_, float y_, float w_, float h_, float c_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    c = c_;
    
    coefficientFriction =  0.1;
  }

  // Is the Mover in the Liquid?
  boolean contains(Mover m) {
    PVector l = m.location;
    return l.x > x && l.x < x + w && l.y > y && l.y < y + h;
  }

  // Calculate drag force
  PVector drag(Mover m) {
    // Magnitude is coefficient * speed squared
    float speed = m.velocity.mag();
    float dragMagnitude = c * speed * speed;

    // Direction is inverse of velocity
    PVector dragForce = m.velocity.get();
    dragForce.mult(-1);

    // Scale according to magnitude
    // dragForce.setMag(dragMagnitude);
    dragForce.normalize();
    dragForce.mult(dragMagnitude);
    return dragForce;
  }

//EDIT BY JEREMY BERNARD TO ADD WATER DENSITY INFO
  void display() {

    noStroke();
    fill(0,128,255,102);
    rect(x, y, w, h);
     textAlign(CENTER);
      text(" Density is : " + c + " \n Jeremy Bernard ",(x + w ) / 2, (y + (h/ 2))) ;     
    textSize(20);
  }
  //nbourre code from github
   PVector draggingForce(PVector speed, float area) {
    float speedMag = speed.mag();
    float coeffRhoMag = c * coefficientFriction * speedMag * speedMag * 0.5;
    
    PVector result = speed.get();
    result.mult(-1);
    result.normalize();
    result.mult(area);
    result.mult(coeffRhoMag);
   
    return result;
  } 
  
}
