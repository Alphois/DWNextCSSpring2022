Individual i0, i1;

void setup() {
  size(400, 200);
  i0 = new Individual(true);
  i1 = new Individual(true);

  println(i0);
  println(i1);
}//setup

void draw() {
  background(255);

  i0.display(100, 100, false);
  i1.display(300, 100, false);
}//draw

void keyPressed() {
  if (key == 'p') {
    i0 = new Individual(true);
    i1 = new Individual(true);
  }
}//keyPressed
