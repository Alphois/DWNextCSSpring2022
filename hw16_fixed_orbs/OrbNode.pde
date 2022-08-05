class OrbNode {
  static final float SPRING_LEN = 50;
  static final float SPRING_CONST = 0.005;
  static final float DAMPING = 0.995;
  static final int ORB_SIZE = 15;
  PVector position;
  PVector velocity;
  PVector acceleration;
  int psize;
  OrbNode next;
  OrbNode previous;
  OrbNode(int x, int y) {
    position = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    psize = ORB_SIZE;
    next=null;
    previous=null;
  }//constructor


  void display() {
    fill(255, 0, 255);
    circle(position.x, position.y, psize);
    if (next!=null) {
      stroke(0, 255, 0);
      line(position.x+3, position.y+3, next.position.x, next.position.y);
    }
    if (previous!=null) {
      stroke(255, 0, 0);
      line(position.x-3, position.y-3, previous.position.x, previous.position.y);
    }
  }//display


  void applySpringForce() {
    if (next!=null) {
      PVector tmp= calculateSpringForce(next);
      applyForce(tmp);
    }
    if (previous!=null) {
      applyForce(calculateSpringForce(previous));
    }
  }
  void run() {
    velocity.add(acceleration);
    if (checkYBoundry()) {
      velocity.y*= -1;
    }
    if (checkXBoundry()) {
      velocity.y*= -1;
    }
    velocity.mult(DAMPING);
    position.add(velocity);
    acceleration.mult(0);
  }//run

  void applyForce(PVector f) {
    acceleration.add(f);
  }//applyForce

  boolean checkYBoundry() {
    boolean check = position.y <= psize/2;
    check = check || position.y >= height - psize/2;
    return check;
  }

  boolean checkXBoundry() {
    boolean check = position.x <= psize/2;
    check = check || position.x >= width - psize/2;
    return check;
  }


  PVector calculateSpringForce(OrbNode other) {
    float dist = position.dist(other.position);
    float displacement = dist - SPRING_LEN;
    float springforce = displacement * SPRING_CONST;

    float xDiff = (other.position.x - position.x);
    float yDiff = (other.position.y - position.y);

    float xForce = springforce * xDiff/dist;
    float yForce = springforce * yDiff/dist;

    return new PVector(xForce, yForce);
  }//calculateSpringForce
}
