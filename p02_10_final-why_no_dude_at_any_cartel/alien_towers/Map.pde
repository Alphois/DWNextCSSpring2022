class Map {
  ArrayList<Alien> aliens;
  ArrayList<SpaceStation> spacestations;
  ArrayList<RammerShip> rammerships;
  ArrayList<SlowTower> slowtowers;
  ArrayList<MissileTower> missiletowers;
  ArrayList<Missile> missiles;
  ArrayList<VortexTower> vortextowers;
  ArrayList<Scrapper> scrappers;
  SelectorBar selectorBar;
  Earth e;
  Map () {
    aliens = new ArrayList<Alien>();
    spacestations = new ArrayList<SpaceStation>();
    rammerships = new ArrayList<RammerShip>();
    slowtowers = new ArrayList<SlowTower>();
    missiletowers = new ArrayList<MissileTower>();
    missiles = new ArrayList<Missile>();
    vortextowers = new ArrayList<VortexTower>();
    scrappers = new ArrayList<Scrapper>();
    e = new Earth(10);
    selectorBar = new SelectorBar();
  }
  void addAlien() {
    int x = int(random(Alien.radius, width-Alien.radius));
    int y = -Alien.radius;
    aliens.add(new Alien(x, y, 100, 2));
  }

  void removeDeadAliens() {
    for (int a = aliens.size()-1; a >= 0; a--) {
      if (aliens.get(a).state == Alien.DEAD) {
        aliens.remove(a);
        rubedo += 1;
      }
    }
  }
  void removeDoneMissiles() {
    for (int m = missiles.size() -1; m >= 0; m--) {
      Missile ms = missiles.get(m);
      // out of bounds left to right
      if (ms.location.x < - ms.radius || ms.location.x > width + ms.radius) {
        missiles.remove(m);
      } else if (ms.location.y < -ms.radius || ms.location.y > height+ms.radius) {
        missiles.remove(m);
      }
    }
  }
  //Make all entities do their action and move forward one tick
  void tick() {
    for (SpaceStation s : spacestations) {
      s.tick();
    }
    for (RammerShip r : rammerships) {
      r.tick();
    }
    for (Missile m : missiles) {
      m.tick();
    }
    for (MissileTower m : missiletowers) {
      m.tick();
    }
    for (VortexTower v : vortextowers) {
      v.tick();
    }
    for (Scrapper t : scrappers) {
      t.tick();
    }
    //This order matters because the slow has to apply before the aliens, move, and then has to go away.
    for (SlowTower s : slowtowers) {
      s.tick();
    }
    for (Alien a : aliens) {
      a.tick();
      a.speed = a.defaultSpeed;
      a.c = color(0, 255, 0);
    }
    e.display();
    selectorBar.display();
    //Scraps dead aliens
    removeDeadAliens();
    //Scraps missiles that have travelled off screen
    removeDoneMissiles();
    //If earth has no more lives, game over
    if (e.lives <= 0) {
      play = false;
      loseGame.play();
      loseGame.jump(0.0);
    }
  }
  //just display all entities without moving them - for when the game is paused
  void display() {
    for (Alien a : aliens) {
      a.display();
    }
    for (SpaceStation s : spacestations) {
      s.display();
    }
    for (RammerShip r : rammerships) {
      r.display();
    }
    for (SlowTower s : slowtowers) {
      s.display();
    }
    for (MissileTower m : missiletowers) {
      m.display();
    }
    for (VortexTower v : vortextowers) {
      v.display();
    }
    for (Scrapper t : scrappers) {
      t.display();
    }
    e.display();
    selectorBar.display();
  }
}
