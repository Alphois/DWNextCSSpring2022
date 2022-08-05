import processing.sound.*;
SoundFile lostALife;
String[] randSFX=new String[6];
SoundFile gameMusic;
SoundFile loseGame;
SoundFile alienDeath;
Map m;
int rubedo = 100;
boolean play = true;
int wave = 0;
int screenCount = 0;
PImage space;
int NUMWAVES =20;

void setup() {

  size(650, 650);
  randSFX[0]="data/Lose0.mp3";
  randSFX[1]="data/Lose1.mp3";
  randSFX[2]="data/Lose2.mp3";
  randSFX[3]="data/Lose3.mp3";
  randSFX[4]="data/AlienDeath0.mp3";
  background(0);
  m = new Map();
  imageMode(CENTER);
  lostALife=new SoundFile(this, "data/PlayerDamage.mp3");
  loseGame= new SoundFile(this, randSFX[int(random(4))]);
  gameMusic=new SoundFile(this, "data/battleMusic.mp3");
  gameMusic.play();
  alienDeath=new SoundFile(this, "data/AlienDeath0.mp3");

  //space = loadImage("space.jpg");
}

void draw() {

  if (play) {
    background(0);
    //image(space,0,0);
    if (gameMusic.position()==gameMusic.duration()-1) {
      gameMusic.jump(0);
    }
    int spawnRate = 1;
    if (wave < NUMWAVES) {
      spawnRate = (NUMWAVES - wave);
    }
    if (screenCount % spawnRate == 0 && wave <= NUMWAVES) {
      m.addAlien();
    }
    if (screenCount % 400 == 0) {
      wave ++;
    }
    if (wave > NUMWAVES && m.aliens.size() == 0) {
      play = false;
    }
    screenCount ++;
    displayWaveNumber();
  } else {
    m.display();
    //display game over
    if (m.e.lives <= 0) {
      displayGameOver();
    }
    if (wave > NUMWAVES && m.aliens.size() == 0) {
      displayWin();
    }
  }
}

void displayWin() {
  textSize(width/10);
  textAlign(CENTER);
  fill(255);
  text("HUMANITY LIVES!", width/2, height/2);
}
void displayGameOver() {
  textSize(100);
  textAlign(CENTER);
  fill(255);
  text("GAME OVER", width/2, height/2);
}
void displayWaveNumber() {
  textSize(30);
  fill(255);
  textAlign(CENTER);
  text("Wave " +str(min(wave, NUMWAVES)), width/2, 40);
  m.tick();
}

//upgrade by clicking
void mouseClicked() {
  m.selectorBar.setSelected(mouseX, mouseY);
  boolean clickedSomething = false; //Used to check if player tried to make an upgrade;
  for (SpaceStation s : m.spacestations) {
    if (s.location.dist(new PVector(mouseX, mouseY)) < s.radius) {
      s.upgrade();
      clickedSomething = true;
    }
  }
  for (RammerShip r : m.rammerships) {
    if (r.location.dist(new PVector(mouseX, mouseY)) < r.radius*2) {
      r.upgrade();
      clickedSomething = true;
    }
  }
  for (SlowTower t : m.slowtowers) {
    if (t.location.dist(new PVector(mouseX, mouseY)) < t.radius) {
      t.upgrade();
      clickedSomething = true;
    }
  }
  for (MissileTower m : m.missiletowers) {
    if (m.location.dist(new PVector(mouseX, mouseY)) < m.radius) {
      m.upgrade();
      clickedSomething = true;
    }
  }
  for (Scrapper s : m.scrappers) {
    if (s.location.dist(new PVector(mouseX, mouseY)) < s.radius) {
      s.upgrade();
      clickedSomething = true;
    }
  }
  for (VortexTower m : m.vortextowers) {
    if (m.location.dist(new PVector(mouseX, mouseY)) < m.radius) {
      m.upgrade();
      clickedSomething = true;
    }
  }
  if ( !clickedSomething && rubedo >= 10 && mouseY < height - m.e.thickness) {
    if (m.selectorBar.selected == SelectorBar.SPACESTATION) {
      m.spacestations.add(new SpaceStation(mouseX, mouseY));
    } else if (m.selectorBar.selected == SelectorBar.RAMMERSHIP) {
      m.rammerships.add(new RammerShip(mouseX, mouseY));
    } else if (m.selectorBar.selected == SelectorBar.SLOWTOWER) {
      m.slowtowers.add(new SlowTower(mouseX, mouseY));
    } else if (m.selectorBar.selected == SelectorBar.MISSILETOWER) {
      m.missiletowers.add(new MissileTower(mouseX, mouseY));
    } else if (m.selectorBar.selected == SelectorBar.VORTEXTOWER) {
      m.vortextowers.add(new VortexTower(mouseX, mouseY));
    } else if (m.selectorBar.selected == SelectorBar.SCRAPPER) {
      m.scrappers.add(new Scrapper(mouseX, mouseY));
    }
    rubedo -= 10;
  }
}

// build by using number keys
void keyPressed() {
  if (key == ' ' && m.e.lives > 0) {
    play = !play;
  }
  if ("123456".indexOf(key) != -1) {
    m.selectorBar.selected = Character.getNumericValue(key);
  }
  if (key== 'm') {
    if (gameMusic.isPlaying()) {
      gameMusic.pause();
    } else {
      gameMusic.loop();
    }
  }
}
