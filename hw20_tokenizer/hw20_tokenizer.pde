
ExpressionTree fir;


void setup() {
  size(800, 400);
  background(200);

  fir = new ExpressionTree(400, 20, 5);

  fir.display(fir.root);
  println(fir.inOrder(fir.root));
}//setup
