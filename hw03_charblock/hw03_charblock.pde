void setup() {
  size(800, 500);
}
color charToColor(char a) {
  return color(a, a, a);
}
void drawChar(char b, int x, int y) {
  fill(charToColor(b));
  square(x, y, b);
}
void draw() {
  int counter=0;
  int y=0;
  int jesus=97;

  for (char c='a'; c<='z'; c++) {
    //how to get  coords?
    println("counter: " + counter);
    if (counter>800-c) {
      y+=c;
      jesus=c;
      counter=0;
    }
    counter= counter+(c);
    println("startx: " + (c-jesus)*c);
    int startx=(c-jesus)*c;
    drawChar(c, startx, y);//side length, startx, start y
  }
}
//a lower is 97, so basically subtract 97 from c then multiply c by c length in px
//add to y iff you can get a new row
