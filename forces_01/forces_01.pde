int nbMovers = 25;
float WindForce;
Liquid water;
Mover[] movers;
Mover ballon;
float Wind_direction;
boolean Water_Effect;
  float random_water_height;
void setup () {
  Water_Effect = true;
  random_water_height = random(0.1 * height, 0.4 * height);
  size (800, 600);
  water = new Liquid(0, height - random_water_height, width, random_water_height, random(1.5,3.0));
  movers = new Mover[nbMovers];
  ballon = new Mover(1,width/2, height/4);
  WindForce = 0.1;
  Wind_direction = 1;
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.1, 5), 0, 0);
  }
  
}

void draw () {
  update();
  background (255);
  if(Water_Effect)
   water.display(); 
  for (int i = 0; i < movers.length; i++) {
    movers[i].display();
  }
  ballon.display();

    
}
  

void keyPressed() {
  if (key == ' ') {
   if( Water_Effect) {
     Water_Effect = false; 
     print("Water is turn off \n");     
   }
   else{
     random_water_height = random(0.1 * height, 0.4 * height);
     water = new Liquid(0, height - random_water_height, width, random_water_height, random(1.5,3.0));     
     Water_Effect = true;
    print("Water is turn on \n"); 
   }
  }
  if (key == 'r' || key == 'R') {
    random_water_height = random(0.1 * height, 0.4 * height);
  water = new Liquid(0, height - random_water_height, width, random_water_height, random(1.5,3.0));    
    print("Reset \n"); 
    setup();
  } 
}

void mousePressed() {
  if (mouseButton == LEFT) {
     print("LEFT WIND \n");
     Wind_direction = 1;
  } else if (mouseButton == RIGHT) {
      print("RIGHT WIND \n");
     Wind_direction = -1;
  } 
}

void update() {
  PVector wind = new PVector(WindForce * Wind_direction, 0);   
  for (int i = 0; i < movers.length; i++) {
    // Is the Mover in the liquid?
    if(Water_Effect){
    if (water.contains(movers[i])) {
      // Calculate drag force
     // PVector dragForce = water.drag(movers[i]);
     PVector dragForce  = water.draggingForce(movers[i].velocity,movers[i].mass);
      // Apply drag force to Mover
      movers[i].applyForce(dragForce);
    }
    
    }    
    
    PVector gravity = new PVector (0, 0.1 * movers[i].mass);
    if(mousePressed){
    movers[i].applyForce(wind);
    }
    
    movers[i].applyForce(gravity);
    movers[i].update();
    movers[i].checkEdges();
  }
     PVector gravity = new PVector (0, -0.05 * ballon.mass);
    if(mousePressed){
     ballon.applyForce(wind);   
      }
     ballon.applyForce(gravity);    
     ballon.update();
     ballon.checkEdges();
}  
