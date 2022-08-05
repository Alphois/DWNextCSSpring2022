//How to use video class
import processing.video.*;
Capture camera;
int filter=0;
int blood=1;
int grey=2;
int shift=3;
/*
Notes on capture class:
 1) get list of current camera devices connected to your computer.
 2) initialize new capture object using the correct camera device.
 3) start receiving data from camera
 4) update capture object each time the camera has new data.
 if camera fps is 30fps, then it will update the capture objects 30 times a second!
 5) draw the data in the capture object to hte screen
 
 */

void setup() {
  size(700, 480);
  //camera=new Capture(this, "pipeline:autovideosrc");
  camera= new Capture(this, "pipeline:autovideosrc");
  camera.start();
}//setup

void draw() {
  PImage pi=camera;

  if (filter==0) {
    pi=camera;
  }
  if (filter==blood) {
    pi=bloodVision(camera);
  }

  if (filter==grey) {
    pi=grayScale(camera);
  }
  if (filter==shift) {
    pi=colorShifter(camera);
  }
  image(pi, 0, 0);
}


void captureEvent(Capture camera) { //this should always take camera as an input (or whatever the global variable is named)
  camera.read();
}
void keyPressed() {
  if (key=='b') {
    filter=blood;
  }
  if (key=='h') {
    filter=shift;
  }
  if (key=='g') {
    filter=grey;
  }
  if (key=='r') {
    filter=0;
  }
  if (key=='s') {saveFrame();
  }
}
PImage grayScale(PImage image) {
  image.loadPixels();
  PImage tmp=new PImage(image.width, image.height);
  tmp.loadPixels();
  for (int p=0; p< image.width; p++) {//cols
    for (int i=0; i<image.height; i++) { //rows
      color currentPx= image.pixels[image.width*i+p];
      float r=red(currentPx);
      float g=green(currentPx);
      float b=blue(currentPx);
      float grey=r+g+b/3.0;
      color greyScale=color(grey, grey, grey);
      tmp.pixels[image.width*i+p]=greyScale;
    }
  }
  return tmp;
}
PImage bloodVision(PImage image) {
  PImage tmp=new PImage (image.width, image.height);
  tmp.loadPixels();
  for (int p=0; p<image.width; p++) {//columns
    for (int i=0; i<image.height; i++) {//rows
      color pc=image.pixels[image.width*i+p];
      float r=red(pc);
      float g=green(pc);
      float b=blue(pc);
      if (g<50 && b <50) {
        r=255;
        g=0;
        b=0;
      }
      float gapClose=r+((1*(255-r))/4);
      color newC=color(gapClose, g, b);
      tmp.pixels[image.width*i+p]=newC;
    }
  }
  return tmp;
}
PImage colorShifter(PImage image) {
  PImage tmp=new PImage(image.width, image.height);
  for (int p=0; p<image.width; p++) {//columns
    for (int i=0; i<image.height; i++) {//rows
      color pc=image.pixels[image.width*i+p];
      float r=red(pc);
      float g=green(pc);
      float b=blue(pc);
      float newG=r;
      float newR=b;
      float newB=g;
      tmp.pixels[image.width*i+p]=color(newR, newG, newB);
    }
  }
  return tmp;
}
