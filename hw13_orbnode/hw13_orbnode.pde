OrbNode a;
OrbNode b;
OrbNode c;
PVector gravity;
void setup() {
  size(800, 800);
  background(255);
  a =new OrbNode(300, 300);
  b=new OrbNode(400, 300);
  c=new OrbNode(500, 300);
  gravity=new PVector(0, 0.05);
  a.next=b;
  b.next=c;
  b.previous=a;
  c.previous=b;
}
void draw() {
  background(255);
  a.display();
  b.display();
  c.display();
  b.applySpringForce();
  b.run();
  b.applyForce(gravity);
  c.applySpringForce();
  c.run();
  c.applyForce(gravity);
}
