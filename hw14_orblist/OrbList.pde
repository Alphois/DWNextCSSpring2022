class OrbList {
  OrbNode front;
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
    //OrbNode jesus;
    //jesus=o.next;
    //while (jesus.next!=null) {
    //  jesus=jesus.next;
    //}
    //OrbNode current;
    //current=front.previous;
    //while (current.previous!=null) {
    //  current=current.previous;
    //}
    //current.previous=jesus.next;
  }
  void append(OrbNode o) {
    front.next=o; 
    o.previous=front;
    //OrbNode jesus;
    //jesus=front.next;
    //while (jesus.next!=null) {
    //  jesus=jesus.next;
    //}
    //OrbNode prevesus;
    //prevesus=o.previous;
    //while (prevesus.previous!=null) {
    //  prevesus=prevesus.previous;
    //}
    //jesus.next=prevesus.previous;
  }
}
