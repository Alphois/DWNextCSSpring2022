class Alien {
  static final int radius = 15;
  PVector location;
  int health;
  int maxHealth;
  static final int ALIVE = 0;
  static final int DEAD = 1;
  static final int LANDED = 2;
  int defaultSpeed;
  color c = color(0, 255, 0);
  int state = ALIVE;
  float speed;
  Alien(int x, int y, int maxH, int s) {
    location = new PVector(x, y);
    maxHealth = maxH;
    health = maxHealth;
    defaultSpeed = s;
    speed = defaultSpeed;
  }
  void displayHealthBar() {
    rectMode(CORNER);
    fill(255);
    rect(location.x-15, location.y-23, 30, 5);
    fill(255, 0, 0);
    rect(location.x-15, location.y-23, 30*(float)health/maxHealth, 5);
  }

  void move() {
    if (location.y < height - radius- m.e.thickness) {
      location.y += speed;
    } else {
      state = LANDED;
      m.e.lives --;
      lostALife.play();
      lostALife.jump(0.2);
    }
  }
  void display() {
    if (state == ALIVE) 
    if (state != DEAD) {
      fill(c);
      circle(location.x, location.y, radius*2);
    }
  }
  void tick() {
    if (health <= 0) {
      state = DEAD;
      alienDeath.play();
      alienDeath.jump(0);
      
    }
    if (state == ALIVE) {
      move();
    }
    display();
  }
}
