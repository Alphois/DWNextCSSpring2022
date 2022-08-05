Gene Ak;
Gene M16;
void setup() {
  Ak=new Gene(5);
  println(Ak.toString());
  Ak.mutate();
  println(Ak.toString());
  M16= new Gene(Ak);
  println(M16.toString());
}
