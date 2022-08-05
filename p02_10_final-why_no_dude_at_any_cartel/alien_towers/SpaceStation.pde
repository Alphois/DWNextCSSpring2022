class SpaceStation extends Ally {
  int firingSpeed;
  int counter;
  SpaceStation(int x, int y) {
    super(x,y);
    range = 200;
    firingSpeed = 15;
    counter = 0;
    damage = 10;
  }
  
  void display() {
    rectMode(CENTER);
    fill(255);
    rect(location.x,location.y,2*radius+radius, radius/2);
    rect(location.x,location.y,radius/2, 2*radius+radius);
    fill(c);
    circle(location.x,location.y,radius*2);
    displayLevel();
  }
  
  void upgrade() {
    if (canUpgrade()) {
      range +=50;
      damage += 10;
      completeUpgrade();
    }
  }

  void tick() {
    if (counter == firingSpeed) {
      counter = 0;
      Alien a = findFurthestAlien(m.aliens);
      if (a != null) {
        stroke(#2CF6FF);
        strokeWeight(damage/10.);
        line(location.x,location.y,a.location.x,a.location.y);
        a.health -= damage;
        stroke(0);
        strokeWeight(1);
      }
    }
    else {
      counter ++;
    }
    display();
  }
}
