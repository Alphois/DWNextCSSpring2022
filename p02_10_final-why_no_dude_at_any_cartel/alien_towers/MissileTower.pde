class MissileTower extends Ally {
  int firingSpeed;
  int counter = 0;
  float heading = -PI/2;
  MissileTower(int x, int y) {
    super(x,y);
    firingSpeed = 50;
    range = 400;
  }
  
  void upgrade() {
    if (canUpgrade()) {
      range += 100;
      firingSpeed -= 5;
      counter = 0;
      completeUpgrade();
    }
  }
  
  void display() {    
    pushMatrix();
    translate(location.x, location.y);
    rotate(heading);
    fill(255);
    rectMode(CENTER);
    rect(radius,0,2*radius, radius);
    fill(c);
    circle(0,0,radius*2);
    popMatrix();
    displayLevel();
  }
  
  void tick() {
    Alien a = findFurthestAlien(m.aliens);
    if (a != null) {
      heading = getAngleTo(a.location);
    }
    if (counter == firingSpeed) {
      counter = 0;
      m.missiles.add(new Missile(int(location.x),int(location.y),heading,level));
    }
    counter++;
    display();
  }
}
