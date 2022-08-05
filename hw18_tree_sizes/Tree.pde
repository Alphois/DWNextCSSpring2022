class Tree {

  static final int Y_SPACE = 75;
  static final int PRE = 0;
  
    static final int POST = 1;
  static final int IN = 2;

  TreeNode root;
  int totalLevels;

  Tree(int x, int y, int numLevels) {
    totalLevels = numLevels;
    root = makeTree(x, y, numLevels);
  }

  TreeNode makeTree(int x, int y, int numLevels) {
    if (numLevels == 0) {
      return null;
    }
    char c = char(int(random(26)) + 'A');
    TreeNode newNode = new TreeNode(x, y, c);

    float xoffset = width / (pow(2, totalLevels - numLevels+2));
    int leftX = int(x + xoffset * -1);
    int rightX = int(x + xoffset);
    int newY = y + Y_SPACE;
    int chanceModifier=numLevels*5;
    if (int(random(100))<50+chanceModifier) {
      newNode.left = makeTree(leftX, newY, numLevels-1);
    }
    //modify such that closer to root is > chance:
    if (int(random(100))<50+chanceModifier) {
      newNode.right = makeTree(rightX, newY, numLevels-1);
    }

    return newNode;
  }

  void display(TreeNode current) {
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
  String preOrder(TreeNode current) {
    if (current != null) {
      return current.data+ " " + preOrder(current.left) + preOrder(current.right);
    }
    return "";
  }

  String postOrder(TreeNode current) {
    if (current != null) {
      return postOrder(current.left) + postOrder(current.right) + current.data + " ";
    }
    return "";
  }

  String inOrder(TreeNode current) {
    if (current != null) {
      return inOrder(current.left) + current.data + " " +  inOrder(current.right);
    }
    return "";
  }
  int numNodes(TreeNode current) {
    if (current!=null) {
      return 1+numNodes(current.left)+numNodes(current.right);
    } else {
      return 0;
    }
  }
  int getHeight(TreeNode current) {
    if (current!=null) {
      int leftNodeHeight=getHeight(current.left);
      int rightNodeHeight=getHeight(current.right);
      return max(leftNodeHeight, rightNodeHeight)+1;
    } else {
      return 0;
    }
  }
  void colorCode(TreeNode current) {
    if (current!=null) {
      colorCode(current.left);
      colorCode(current.right);
      if (getHeight(current.left)==getHeight(current.right)) {
        current.c=color(255, 255, 0);
      }
    }
  }
  //boolean isLeaf(TreeNode current) {
  //  if (current.left==null && current.right==null) {
  //  }
  //}
}
