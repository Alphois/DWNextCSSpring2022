class PathShape {

  IntList xs;
  IntList ys;
  color inside;
  color border;

  PathShape() {
    xs = new IntList();
    ys = new IntList();
    inside = color(255);
    border = color(0);

  }//constructor

  void display() {

    stroke(border);
    fill(inside);

    beginShape();
    for ( int i = 0; i < xs.size(); i++ )
      vertex( xs.get(i), ys.get(i) );
    endShape(CLOSE);
    
  }//display


  void addPoint(int x, int y) {
    xs.append(x);
    ys.append(y);

  }//addPoint

}//class PathShape
