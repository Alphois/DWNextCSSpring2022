class OrbList {
  OrbNode front;
  OrbNode back;
  OrbList(int x, int y) {
    front=new OrbNode(x, y);
  }//constructor
  void display() {
    front.display();
    OrbNode current;
    current=front;
    while (current!=null) {
      current.display();
      current=current.next;
    }
  }
  void addFront(OrbNode o) {
    o.next=front;
    front.previous=o;
    front=o;
  }
  void addFront(int x, int y) {
    OrbNode nu=new OrbNode(x, y);
    nu.next=front;
        front.previous=nu;
        front=nu;

  }
  void append(OrbNode o) {
    front.next=o;
    o.previous=front;
  }
  void append(int x, int y) {
    OrbNode nu=new OrbNode(x,y);
    back.next=nu;
    nu.previous=back;
    back=nu;
  }
  void run() {
    for (OrbNode current=back; current!=null; current=current.next) {
      current.run();
    }
  }
  void applySprings() {
    for (OrbNode current=back; current!=null; current=current.next) {
      current.applySpringForce();
    }
  }
}
