class Ally {
  PVector location;
  int radius;
  int damage;
  int range;
  int level = 1;
  color c = color(0,0,255);
  
  int upgradePrice() {
    return level*10;
  }
  Ally(int x, int y) {
    location = new PVector(x,y);
    radius = 20;
  }
  void displayLevel() {
    textAlign(CENTER);
    textSize(radius);
    fill(255);
    text(level,location.x,location.y+radius/3);
  }
    
  Alien findFurthestAlien(ArrayList<Alien> aliens) {
    Alien furthest = null;
    for(Alien a: aliens) {
      if (a.state == Alien.ALIVE && location.dist(a.location) <= range) {
        if (furthest == null) {
          furthest = a;
        }
        else if (a.location.y > furthest.location.y) {
          furthest = a;
        }
      }
    }
    return furthest;
  }
  
  Alien findClosestAlien(ArrayList<Alien> aliens) {
    Alien closest = null;
    for(Alien a: aliens) {
      if (a.state == Alien.ALIVE) {
        if (closest == null) {
          closest = a;
        }
        else if (location.dist(a.location) < location.dist(closest.location)) {
          closest = a;
        }
      }
    }
    return closest;
  }
  float getAngleTo(PVector spot) {
    float theta = atan((spot.y - location.y)/(spot.x - location.x));
    if (spot.x <= location.x) {
      theta = PI + theta;
    }
    return theta;
  }
  boolean canUpgrade() {
    return level <5 && rubedo >=upgradePrice();
  }
  void smash(int zone) {
    for (Alien a: m.aliens) {
      if (a.state == Alien.ALIVE) {
        if (location.dist(a.location) <= zone + Alien.radius) {
          a.health -= damage;
        }
      }
    }
  }
  void completeUpgrade() {
    c = color(red(c)+50,0,blue(c)-50);
    rubedo -= upgradePrice();
    level += 1;
  }
  void upgradeBar() {
    fill(255);
    rectMode(CENTER);
    rect(location.x,location.y-80, 240, 70);
    textAlign(CENTER, CENTER);
    textSize(15);
    fill(0);
    
    text(damage,location.x+80, location.y-95);
    text("Damage",location.x+80, location.y-80);
    text("$" + str(damage),location.x+80, location.y-65);
  }
  
}
