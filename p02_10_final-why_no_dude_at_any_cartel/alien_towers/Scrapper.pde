class Scrapper extends Ally {
  Scrapper(int x,int y) {
    super(x,y);
    damage = 30;
  }
  void display() {
    rectMode(CENTER);
    fill(255);
    rect(location.x,location.y,radius,radius*2);
    fill(c);
    rect(location.x,location.y,radius*1.5,radius*1.5);
    //cool x
    strokeWeight(2);
    line(location.x-radius/2,location.y-radius/2,location.x+radius/2,location.y+radius/2);
    line(location.x+radius/2,location.y-radius/2,location.x-radius/2,location.y+radius/2);
    strokeWeight(1);
    displayLevel();
  }
  void upgrade() {
    if (canUpgrade()) {
      damage += 30;
      completeUpgrade();
    }
  }
  void tick() {
    display();
    for (Alien a: m.aliens) {
      if (a.state == Alien.ALIVE) {
        if (location.dist(a.location) <= Alien.radius) {
          a.health -= damage;
          if (a.health <= 0) {
            rubedo += 0; 
          }
        }
      }
    }
  }
}
