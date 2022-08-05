//How to use video class
import processing.video.*;
Capture camera;
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
  size(640, 480);
  String[] cams= Capture.list();
  //capture.list is a list of cameras
  //*is a list of string objects
 // println(cams[0]);
  //camera=new Capture(this, cams[0]);
  camera= new Capture(this, "pipeline:autovideosrc");
  camera.start();
}//setup

void draw() {
  PImage pi=grayScale(camera);
  image(pi, 0, 0);
}

void captureEvent(Capture camera) { //this should always take camera as an input (or whatever the global variable is named)
  camera.read();
}
PImage grayScale(PImage image) {
  image.loadPixels();
  PImage tmp=new PImage(image.width,image.height);
  tmp.loadPixels();
  for (int p=0; p< image.width; p++) {//cols
    for (int i=0; i<image.height; i++) { //rows
      color currentPx= image.pixels[image.width*i+p];
      float r=red(currentPx);
      float g=green(currentPx);
      float b=blue(currentPx);
      float grey=r+g+b/3.0;
      color greyScale=color(grey,grey,grey);
      tmp.pixels[image.width*i+p]=greyScale;
      
    }
  }
  return tmp;
}
