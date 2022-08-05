PathShape ps;


void setup() {
  size(500, 500);
  ps = new PathShape();
  ps.display();
}//setup



void draw() {
  background(0, 255, 0);
  ps.display();
}//draw


void mousePressed() {
  ps.addPoint(mouseX, mouseY);
}//mouseClicked
