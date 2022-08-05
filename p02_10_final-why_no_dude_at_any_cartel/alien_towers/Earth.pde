class Earth {
  int lives;
  int thickness = 100;
  Earth (int l) {
    lives = l;
  }
  void display() {
    rectMode(CORNER);
    fill(0,0,255);
    rect (0,height-thickness,width,thickness);
    float textSize=0.20*thickness;
    textSize(textSize);
    fill(255);
    textAlign(CORNER);
    text("Lives: " + lives,10,height-textSize*3);
    text("Rubedo: " + rubedo,10,height-textSize);
  }
}  
