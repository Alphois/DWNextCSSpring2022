ExpressionTree fir;


void setup() {
  size(800, 400);
  background(255);
  fir = new ExpressionTree(400, 20, 5);
  println("this runstoo!");
  //fir.display(fir.root);
  println(fir.traverse(ExpressionTree.IN));
}//setup
