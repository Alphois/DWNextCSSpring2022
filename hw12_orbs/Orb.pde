class Orb {
  static final float DAMPING=0.995;
  static final float SPRING_CONST=0.05;
  static final float SPRING_LEN=50;

  PVector position;
  PVector velocity;
  PVector acceleration;
  float psize;
  //instance variables
  Orb(float x, float y) {
    position=new PVector(x, y);
    velocity=new PVector(0, 0);
    acceleration=new PVector(0, 0);
    psize=15;
  }//constructor

  void display() {
    fill(255, 0, 255);
    circle(position.x, position.y, psize);
  }//display
  void run() {
    //acceleration.mult(0);
    velocity.add(acceleration);
    if (checkYBoundary()) {
      velocity.y*=-1;
    }
    if (CheckXBoundary()) {
      velocity.x*=-1;
    }
    velocity.mult(0.995);
    position.add(velocity);
    acceleration.mult(DAMPING);
  }

  boolean checkYBoundary() {
    boolean check=position.y<=psize/2;
    check = check || (position.y>=height-psize/2);
    return check;
  }
  boolean CheckXBoundary() {
    boolean check=position.x<=psize/2;
    check = check || (position.x>=width-psize/2);
    return check;
  }
  void applyForce(PVector f) {
    acceleration.add(f);
  }
  PVector calculateSpring(Orb other) {
    float dist=position.dist(other.position);
    float displacement=dist-SPRING_LEN;
    float springForce = displacement * SPRING_CONST;
    float xDiff=other.position.x-position.x;
    if (xDiff<0) {
      springForce*=-1;
    }
    float xForce=springForce*xDiff/dist;
    return new PVector(springForce,0);
    //spring constant
  }
}
