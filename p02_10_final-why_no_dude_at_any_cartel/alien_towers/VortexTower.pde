class VortexTower extends Ally{
  float pullPower;
  VortexTower(int x, int y) {
    super(x,y);
    range = 75;
    pullPower = .5;
    radius = 24;
  }
  void display() {
    fill(c);
    beginShape(TRIANGLES);
    vertex(location.x, location.y+radius);
    vertex(location.x-radius, location.y-radius);
    vertex(location.x+radius, location.y-radius);
    endShape();
    displayLevel();
  }
  void tick() {
    for (Alien a: m.aliens) {
      if (location.dist(a.location) <= range && a.location.y < location.y) {
        if (a.location.x + pullPower < location.x) {
          a.location.x += pullPower;
        }
        else if (a.location.x -pullPower > location.x) {
          a.location.x -= pullPower;
        }
      }
    }
    display();
  }
  void upgrade() {
    if (canUpgrade()) {
      pullPower += .5;
      range += 30;
      completeUpgrade();
    }
  }
}
