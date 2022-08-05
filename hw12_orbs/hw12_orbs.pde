Orb o1;
Orb o2;
float GRAVITY = 0.1;
PVector g;

boolean moving;

void setup() {
  size(800, 400);
  g = new PVector(0, GRAVITY);
  Orb o1=new Orb(30, 200);
  Orb o2=new Orb(100, 200);
  reset();
}//setup

void draw() {
  background(255);
  if (moving) {
    PVector spring=o2.calculateSpring(o1);
    o2.applyForce(spring);
    spring=o1.calculateSpring(o2);
    o1.applyForce(spring);
    o1.run();
    o2.run();
  }
  o1.display();
  o2.display();
}//draw

void reset() {
  moving = false;
  o1 = new Orb(30, 290);
  o2 = new Orb(100, 200);
}//reset

void keyPressed() {
  if (key == ' ') {
    moving = !moving;
  }
  if (key == 'h') {
    o1.applyForce(new PVector(6, -6));
    moving = true;
  }
  if (key == 'r') {
    reset();
  }
}
