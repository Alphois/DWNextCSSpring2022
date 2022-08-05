Tree fir; //<>//
void setup() {
  size(800, 500);
  fir = new Tree(400, 20, 6);
    fir.colorCode(fir.root);

  fir.display(fir.root);
  println(fir.traverse(Tree.PRE));
  println(fir.traverse(Tree.POST));
  println(fir.traverse(Tree.IN));
  println(fir.numNodes(fir.root));
  println(fir.getHeight(fir.root));
}//setup

void keyPressed() {
  if (key=='r') {
  }
}
