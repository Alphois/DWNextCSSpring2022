class TriangleGon extends PathShape {


  void addPoint(int x, int y) {
    if (xs.size() < 3) {
      super.addPoint(x, y);
    }
  }

  void setCentroid() {
    int sumX = 0;
    int sumY = 0;

    for (int i=0; i < xs.size(); i++) {
      sumX+= xs.get(i);
      sumY+= ys.get(i);
    }
    centroid[0] = sumX / 3;
    centroid[1] = sumY / 3;
  }//setCentroid

  void setArea() {
    if (xs.size() == 3) {
     area = xs.get(0) * (ys.get(1)-ys.get(2));
     area+= xs.get(1) * (ys.get(2)-ys.get(0));
     area+= xs.get(2) * (ys.get(0)-ys.get(1));
     area = abs(area / 2);
   }
   else {
     area = 0;
   }
  }//setArea

}//TriangleGon
