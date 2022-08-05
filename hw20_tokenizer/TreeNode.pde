class TreeNode {

  static final int PART_SIZE = 20;

  PVector position;
  int psize;
  color c;

  char data;

  TreeNode left;
  TreeNode right;

  TreeNode(int x, int y, char d) {
    position = new PVector(x, y);
    psize = PART_SIZE;
    left = null;
    right = null;
    c = color(240, 140, 40);
    data = d;
  }//constructor


  void display() {
    if (left != null) {
      stroke(40, 200, 190);
      line(position.x, position.y, left.position.x, left.position.y);
    }
    if (right != null) {
      stroke(210, 50, 150);
      line(position.x, position.y, right.position.x, right.position.y);
    }
    stroke(0);
    fill(c);
    circle(position.x, position.y, psize);
    fill(0);
    textAlign(CENTER, CENTER);
    text(data, position.x, position.y);
  }//display

}//Orb
