class PathShape {
  int centroid[];
  float area;
  IntList xs;
  IntList ys;
  color inside;
  color border;

  PathShape() {
    xs = new IntList();
    ys = new IntList();
    inside = color(255);
    border = color(0);
    centroid =  new int[2];
    area=0;
  }//constructor

  void display() {

    stroke(border);
    fill(inside);

    beginShape();
    for ( int i = 0; i < xs.size(); i++ )
      vertex( xs.get(i), ys.get(i));
    endShape(CLOSE);
    if (xs.size()>3) {
      fill(255, 0, 0);
      setArea();
      setCentroid();
      circle(centroid[0], centroid[1], 5);
    }
  }//display


  void addPoint(int x, int y) {
    xs.append(x);
    ys.append(y);
  }//addPoint
  void setArea() {
    float temp=0;
    for (int i=0; i<xs.size()-1; i++) {
      if (i==xs.size()-1) {
        temp+=(xs.get(i)*ys.get(0) - xs.get(i)+ys.get(i));
      }
      temp+= (xs.get(i)*ys.get(i+1)-xs.get(i+1)*ys.get(i));
    }
    area=temp/2;
  }
  void setCentroid() {
    float Cx=0;
    float Cy=0;
    for ( int i = 0; i < xs.size()-1; i++ ) {
      if (i==xs.size()-1) {
        Cx+=((xs.get(i)+xs.get(0))*(xs.get(i)*(ys.get(0)-xs.get(i)*ys.get(i))));
        Cy+=((ys.get(i)+ys.get(0))*(xs.get(i)*(ys.get(0)-xs.get(i)*ys.get(i))));
      }
      Cx+=((xs.get(i)+xs.get(i+1))*((xs.get(i)*(ys.get(i+1)-xs.get(i)*ys.get(i)))));
      Cy+= ((ys.get(i)+ys.get(i+1))*((xs.get(i)*(ys.get(i+1)-xs.get(i)*ys.get(i)))));
    }
    Cx=(1/(6*area))*Cx;
    Cy=(1/(6*area))*Cy;
    centroid[0]=int(Cx);
    centroid[1]=int(Cy);
    println(centroid[0]);
    println(centroid[1]);
    println(xs.get(0));
    println(ys.get(0));
  }
}//class PathShape
