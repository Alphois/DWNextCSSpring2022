class PathShape {

  IntList xs;
  IntList ys;
  int centroid[];
  float area;
  color inside;
  color border;

  PathShape() {
    xs = new IntList();
    ys = new IntList();
    inside = color(255);
    border = color(0);
    centroid = new int[2];
    area = 0;
    topY=0;
    leftX=0;
    shapeWidth=width;
    shapeHeight=height;
  }//constructor

  void display() {

    stroke(border);
    fill(inside);
    beginShape();
    for ( int i = 0; i < xs.size(); i++ )
      vertex( xs.get(i), ys.get(i) );
    endShape(CLOSE);

    noStroke();
    fill(0, 0, 255);
    circle(centroid[0], centroid[1], 5);
  }//display

  void setCentroid() {
    int sumX = 0;
    int sumY = 0;
    for (int i=0; i < xs.size(); i++ ) {
      int p0, p1;
      p0=i;
      if (i == xs.size()-1) {
        p1 = 0;
      } else {
        p1 = i+1;
      }
      sumX += (xs.get(p0) + xs.get(p1)) * ((xs.get(p0) * ys.get(p1)) - (xs.get(p1) * ys.get(p0)));
      sumY += (ys.get(p0) + ys.get(p1)) * ((xs.get(p0) * ys.get(p1)) - (xs.get(p1) * ys.get(p0)));
    }
    setArea();
    centroid[0] = int( (1 / (6 * area)) * sumX );
    centroid[1] = int( (1 / (6 * area)) * sumY );
  }//setCent
  void randomize() {
    xs.clear();
    ys.clear();
    int right_x=left_x+shapeWidth;
    int bottom_y=right_x+shapeWidth;
    int numPoints=int(random(3, MAX_RANDOM_POINTS+1));
    for (int s=0; s<numPoints; s++) {
    }
    addPoint(x, y);
  }
  void setArea() {
    area = 0;
    for ( int i=0; i < xs.size(); i++) {
      int p0, p1;
      p0 = i;
      if (i == xs.size()-1) {
        p1 = 0;
      } else {
        p1 = i+1;
      }
      area += (xs.get(p0) * ys.get(p1)) - (xs.get(p1) * ys.get(p0));
    }
    area = area * 0.5;
  }//setArea

  void addPoint(int x, int y) {
    xs.append(x);
    ys.append(y);

    setCentroid();
  }//addPoint
  void center() {
    int xCent=leftX+shapeWidth/2;
    int yCent=topY+shapeHeight/2;
    int xoff=xCent - centroid[0];
    int yoff=yCent - centroid[1];
  }
}//class PathShape
