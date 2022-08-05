Tree fir;


void setup() {
  size(800, 500);

  fir = new Tree(450, 20, 4);
  fir.display(fir.root);
  println(fir.preOrder(fir.root));
}//setup
