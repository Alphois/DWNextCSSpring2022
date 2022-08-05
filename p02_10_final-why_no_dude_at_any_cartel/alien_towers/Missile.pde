class Missile extends Ally {
  PVector velocity;
  float speed;
  PImage image;
  Missile(int x, int y, float theta, int l) {
    super(x, y);
    level = l;
    speed = 30;
    damage = level*20;
    radius = 10;
    velocity = new PVector(cos(theta)*speed, sin(theta)*speed);
  }
  void display() {
    fill(255);
    circle(location.x,location.y,radius*2);
  }
  
  void tick() {
    location.add(velocity);
    display();
    smash(radius);
  }
}
