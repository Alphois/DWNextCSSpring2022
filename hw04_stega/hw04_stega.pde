PImage megalo;
void setup() {
  megalo=loadImage("thiccSecret.png");
  megalo.loadPixels();
  size(1000, 1000);
  println(decodeTalker());
  
}
void draw() {
  image(megalo, 0, 0);
}
String decodeTalker() {
  megalo.loadPixels();
  String jesus="";

  for (int p=0; p < megalo.pixels.length; p++) { //rows

    color currentPx=megalo.pixels[p];

    if (p<megalo.pixels.length-1) {
      color yoMama = megalo.pixels[p+1];

      if (currentPx==color(0)) {
        //println("red: "+ red(yoMama) + "green: " + green(yoMama) + "blue: " + blue(yoMama));
        println(char(int(red(yoMama))));
        jesus+=char(int(red(yoMama)));
      }
    }
  }
  return jesus;
}


//the code is "hello, world!"
