OrbList o1;
OrbNode a;
OrbNode b;
OrbNode c;
void setup() {
  size(800,800);
  
  o1=new OrbList(400,400);
  a= new OrbNode(100,200);
  b=new OrbNode(200,200);
  c=new OrbNode(300,200);
  o1.addFront(a);
  o1.append(b);
  o1.append(c);
  o1.run();
  o1.display();
}
