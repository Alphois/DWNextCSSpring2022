class Tree {
  TreeNode root;
  int totalLevels;
  Tree(int x, int y, int numLevels) {
    root=makeTree(x, y, numLevels);
    //root.left=makeTree(x, y, numLevels);
    //root.right=makeTree(x, y, numLevels);
  }
  TreeNode makeTree(int x, int y, int numLevels) {
    TreeNode nu=new TreeNode(x, y);
    nu.data=char(int(random(255)));
    if (numLevels<0) {
      return null;
    } else {
      if (int(random(2))<1) {
        float xOffset=width/(pow(2, totalLevels-numLevels+2));
        int leftX=int(x+xOffset*-1);
        int rightX= int(x+xOffset);
        nu.left = makeTree(leftX, y+50, numLevels-1);
        nu.right=makeTree(rightX, y+50, numLevels-1);
      }
    }
    return nu;
  }
  void display(TreeNode current) {
    if (current!=null) {
      current.display();
      display(current.left);
      display(current.right);
    }
  }
  String preOrder (TreeNode tn) {
    String s="";
    if (tn!=null) {
      s+=tn.data;
      preOrder(tn.left);
      preOrder(tn.right);
    }
    return s;
  }
  String inOrder (TreeNode tn) {
    String s="";
    if (tn!=null) {
      inOrder(tn.left);
      s+=tn.data;
      inOrder(tn.right);
    }
    return s;
  }
  String postOrder (TreeNode tn) {
    String s="";
    if (tn!=null) {
      postOrder(tn.left);
      postOrder(tn.right);
      s+=tn.data;
    }
    return s;
  }
  String traverse(String type) {
    if (type=="postOrder") {
    }
  }
}
