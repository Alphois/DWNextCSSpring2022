class RegularGon extends PathShape {

  int numSides;
  int gonLength;

  RegularGon(int cx, int cy, int sides, int length) {
    //super();
    centroid[0] = cx;
    centroid[1] = cy;
    numSides = sides;
    gonLength = length;
    generateRegularPolygon();
  }//PathShape

  void generateRegularPolygon() {
    float theta = radians(360 / numSides);
    for (int n=0; n < numSides; n++) {
      int x = int(gonLength * cos(n * theta)) + centroid[0];
      int y = int(gonLength * sin(n * theta)) + centroid[1];
      xs.append(x);
      ys.append(y);
    }
  }//generateRegularPolygon
  boolean isValid() {
    return xs.size()>0;
  }//RegularGon
   void randomize() {
    centroid[0] = leftX + shapeWidth/2;
    centroid[1] = topY+ shapeHeight/2;
    numSides = int(random(3, MAX_SIDES+1));

    gonLength = int(random(5, shapeWidth/2));
    generateRegularPolygon();
  }
}
