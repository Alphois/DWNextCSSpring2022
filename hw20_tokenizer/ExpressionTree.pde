class ExpressionTree {

  static final int Y_SPACE = 75;
  static final int PRE = 0;
  static final int POST = 1;
  static final int IN = 2;

  ExpressionTreeNode root;
  int totalLevels;

  ExpressionTree(int x, int y, int numLevels) {
    totalLevels = numLevels;
    root = makeTree(x, y, numLevels);
    populateTree(root);
  }//constructor

  ExpressionTreeNode makeTree(int x, int y, int numLevels) {
    if (numLevels == 0) {
      return null;
    }

    ExpressionTreeNode newNode = new ExpressionTreeNode(x, y, 0, 0);

    float xoffset = width / (pow(2, totalLevels - numLevels+2));
    int leftX = int(x + xoffset * -1);
    int rightX = int(x + xoffset);
    int newY = y + Y_SPACE;
    int chanceModifier=numLevels*10;
    if (int(random(100))<50+chanceModifier) {
      newNode.left = makeTree(leftX, newY, numLevels-1);
      newNode.left.value=0;
      newNode.left.type=0;
      newNode.right = makeTree(rightX, newY, numLevels-1);
      newNode.right.value=0;
      newNode.right.type=0;
    }
    return newNode;
  }//makeTree

  void populateTree(ExpressionTreeNode current) {
    while (current!=null) {
      if (current.left==null&&current.right==null) {
        current.type=ExpressionTreeNode.VAL;
        current.value=int(random(100));
      } else {
        current.left.type=int(random(0, 3));
      }
      populateTree(current.left);
      populateTree(current.right);
    }
  }//populateTree



  void display(ExpressionTreeNode current) {
    if (current != null) {
      current.display();
      display(current.left);
      display(current.right);
    }
  }//display

  String traverse(int type) {
    if (type == PRE)
      return preOrder(root);
    else if (type == POST)
      return postOrder(root);
    else if (type == IN)
      return inOrder(root);
    return "";
  }

  String preOrder(ExpressionTreeNode current) {
    if (current != null) {
      return current.value+ " " + preOrder(current.left) + preOrder(current.right);
    }
    return "";
  }

  String postOrder(ExpressionTreeNode current) {
    if (current != null) {
      return postOrder(current.left) + postOrder(current.right) + current.value + " ";
    }
    return "";
  }

  String inOrder(ExpressionTreeNode current) {
    if (current != null) {
      return inOrder(current.left) + current.value + " " +  inOrder(current.right);
    }
    return "";
  }
}//OrbTree
