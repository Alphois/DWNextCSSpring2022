class RammerShip extends Ally {
  float speed;
  PVector velocity;
  Alien currentTarget;
  RammerShip(int x,int y) {
    super(x,y);
    radius = 15;
    damage = 5;
    speed = .1;
    velocity = new PVector(0,0);
  }
  void upgrade() {
    if (canUpgrade()) {
      speed += .1;
      damage += 5;
      completeUpgrade();
    }
  }
  void display() {
    float theta = velocity.heading() + PI/2;
    fill(200, 100);
    stroke(0);
    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);

    // Thrusters
    rectMode(CENTER);
    fill(255);
    rect(-radius/2, radius*2, radius/2, radius);
    rect(radius/2, radius*2, radius/2, radius);
    // Rocket body
    fill(c);
    beginShape(TRIANGLES);
    vertex(0, -radius*2);
    vertex(-radius, radius*2);
    vertex(radius, radius*2);
    endShape(); 
    
    popMatrix();
    
    //Level
    displayLevel();
  }
  
  PVector getAccelerationTowards(PVector spot) {
    float theta = getAngleTo(spot);
    return new PVector(cos(theta)*speed,sin(theta)*speed);
  }
  
  void move(PVector acceleration) {
    location.add(velocity);
    if (location.dist(currentTarget.location) < (new PVector(location.x+velocity.x,location.y+velocity.y).dist(currentTarget.location))) {
      velocity.mult(1-(.1*level));
    }
      velocity.add(acceleration);
    
    
  }
  
  Alien findClosestAlien(ArrayList<Alien> aliens) {
    Alien closest = null;
    for(Alien a: aliens) {
      if (a.state == Alien.ALIVE) {
        if (closest == null) {
          closest = a;
        }
        else if (location.dist(a.location) < location.dist(closest.location)) {
          boolean alienAlreadyTaken = false;
          for (RammerShip r: m.rammerships) {
            if (r != this && r.currentTarget == a) {
              alienAlreadyTaken = true;
            }
          }
          if (!alienAlreadyTaken) {
            closest = a;
          }
        }
      }
    }
    return closest;
  }
  
  void tick() {
    currentTarget = findClosestAlien(m.aliens);
    if (currentTarget == null || currentTarget.state != Alien.ALIVE) {
      location.add(velocity);
    }
    else {
      move(getAccelerationTowards(currentTarget.location));
      smash(radius);
      if (currentTarget.state == Alien.DEAD) {
        currentTarget = findClosestAlien(m.aliens);
      }
    }
    display();    
  }
}
