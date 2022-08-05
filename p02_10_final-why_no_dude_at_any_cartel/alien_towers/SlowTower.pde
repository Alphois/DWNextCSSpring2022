class SlowTower extends Ally {
  float slowPercent;
  SlowTower(int x,int y) {
    super(x,y);
    range = 100;
    slowPercent = .2;
  }
  void display() {
    rectMode(CENTER);
    fill(255);
    rect(location.x,location.y,radius*2,radius*2);
    fill(c);
    rect(location.x,location.y,radius*1.5,radius*1.5);
    displayLevel();
  }
  void upgrade() {
    if (canUpgrade()) {
      range +=25;
      slowPercent += .1;
      completeUpgrade();
    }
  }
  void tick() {
    display();
    for (Alien a: m.aliens) {
      if (a.state == Alien.ALIVE && location.dist(a.location) <= range) {
        a.speed = a.speed * (1-slowPercent);
        a.c = color(200,255,200);
      }
    }
  }
}
