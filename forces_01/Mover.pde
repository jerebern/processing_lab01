class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float topSpeed;
  float mass;
  float bouncing;
  Mover () {
    this.location = new PVector (random (width), random (height));    
    this.velocity = new PVector (0, 0);
    this.acceleration = new PVector (0 , 0);
    
    this.mass = 1;
  }  
  
  Mover (PVector loc, PVector vel) {
    this.location = loc;
    this.velocity = vel;
    this.acceleration = new PVector (0 , 0);
    
    this.topSpeed = 100;
  }
  
  Mover (float m, float x, float y ) {
    mass = m;
    location = new PVector (x, y);
    
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  Mover (float m, float x, float y, color bouncing) {
    this.mass = m;
    this.location = new PVector (x, y);
    this.bouncing = bouncing;
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    this.topSpeed = 100;
  }

  
  void update () {
    velocity.add (acceleration);
    location.add (velocity);

    acceleration.mult (0);
  }
  
  void display () {
    stroke (0);
    fill (127, 127, 127, 127);
    
    ellipse (location.x, location.y, mass * 16, mass * 16); // Dimension à l'échelle de la masse
  }
  
  void checkEdges() {
    if (location.x > width) {
      location.x = width;
      velocity.x *= -0.9;

    } else if (location.x < 0) {
      velocity.x *= -0.9;
      location.x = 0;
    }
    
    if (location.y > height) {
      velocity.y *= -0.9;
      location.y = height;
    }
    else if(location.y < 0){
      velocity.y = velocity.y * -0.9;
      location.y = 0;      
    }
  }
  void applyForce (PVector force) {
    PVector f = PVector.div (force, mass);
   
    this.acceleration.add(f);
  }

  float get_Bouncing(){

    return this.bouncing;

  }
}
