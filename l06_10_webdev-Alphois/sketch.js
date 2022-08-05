//Krishna Dudani
var 
  cxSun,cySun, thetaSun,
  cxHourHand, cyHourHand,
  cxMinuteHand, cyMinuteHand, 
  cxSecondHand, cySecondHand, 
  thetaHourHand, thetaMinuteHand, thetaSecondHand, 
  hourHandLength, minuteHandLength, secondHandLength, 

  thetaHourIncrement, thetaMinuteIncrement, thetaSecondIncrement, 
/*=====
 I have decided that I want theta to increment for the hour
 hand, minute hand, and second hand each by a seperate value every second
 =====*/

  radius, centerX, centerY;
function setup() {
  createCanvas(1000, 1000);
  //distance from the center 
  centerX=width/2;
  centerY=height/2;
  radius=((width * 4) / 5);
  //this is the radius of the clock circle)
  //Hour Hand variables
  hourHandLength=(width*4/25);
  //Minute Hand variables
  minuteHandLength=(width*9/25);
  //Second Hand variables
  secondHandLength=(width*9.5/25);
}
funcion draw() {
  frameRate(1);
  println("hour: " + hour());
  println("min: " + minute());
  println("sec: " + second());
  println((((hour()%12)*255)/12));
  background(((hour()%12)*255)/12);
  //*lets change the shade of the background according to the time of day
/*=====
Lets make the clock my avater
=====*/
stroke(0,0,80);
strokeWeight(8);
fill(#D499E5);
circle(centerX,centerY,radius);
float ycorEyesStart= centerX-20;

line(ycorEyesStart,ycorEyesStart,ycorEyesStart,ycorEyesStart+10);
//eye1
line(ycorEyesStart+30,ycorEyesStart,ycorEyesStart+30,ycorEyesStart+10);
//eye2
line(ycorEyesStart+5,ycorEyesStart+40,ycorEyesStart+35,ycorEyesStart+40);
//beginning of mouth

line(ycorEyesStart+35,ycorEyesStart+40, ycorEyesStart+40, ycorEyesStart+35);
//smirk
  circle(centerX, centerY, radius);

  /*=====
   Let's draw a sun!
   --> adding red to green=yellow
   --> the sun's position in the sky will be de
   --> the sun rises in the east and sets in the west
   =====*/
   //fill(255,255,0);
   //thetaSun=0;
   //cxSun=newX(100,centerX,thetaSun);
   //cySun=newY(100,centerY,thetaSun);
   //circle (cxSun,cySun,60);
   //thetaSun+=1;

  /*=====
   hour hand tings
   =====*/
  thetaHourHand= thetaHour();

  cxHourHand=newX(hourHandLength, centerX, thetaHourHand);
  cyHourHand=newY(hourHandLength, centerY, thetaHourHand);
  stroke(0, 128, 0);
  line(centerY, centerX, cxHourHand, cyHourHand);
  /*=====
   Minute hand stuff
   =====*/
  thetaMinuteHand=thetaMinute();
  cxMinuteHand=newX(minuteHandLength, centerX, thetaMinuteHand);
  cyMinuteHand=newY(hourHandLength, centerY, thetaMinuteHand);
  stroke(0, 175);
  //make it slightly see through so you can see the hour hand if its ever overlapping
  line(centerX, centerY, cxMinuteHand, cyMinuteHand);

  /*=====
   SecondHand line
   =====*/
  thetaSecondHand=thetaSecond();

  cxSecondHand=newX(secondHandLength, centerX, thetaSecondHand);
  cySecondHand=newY(secondHandLength, centerY, thetaSecondHand);

  stroke(77, 0, 0, 175);
  //make this slightly see through so you can see the minute and hour hand if they overlap with this
  line(centerX, centerY, cxSecondHand, cySecondHand);
  //println(thetaHourHand+ "  " + thetaMinuteHand + "    " + thetaSecondHand);
}
function newX(float pathRadius, float centerX, float theta) {
  //keep in mind that centerY for this method is NOT the same as the
  //earlier global variable defined which also happens to be centerX
  float x=(cos(radians(theta)));
  x=x*pathRadius+centerX;
  return x;
}
function newY( pathRadius, centerY,  theta) {
  //keep in mind that centerX for this method is NOT the same as the
  //earlier global variable defined which also happens to be centerY
  //pathRadius is the radius of the circular path that the circle follows
  var y=(sin(radians(theta)));
  y=centerY+y*pathRadius;
  return y;
  //think polar coords: y=rsin(theta)
  //smooort right
  //yessir
}
function thetaHour() {
  thetaHourHand= ((hour()%12)*360/12)-90;
  return thetaHourHand;
}
//gives the angle that theta must be for hour hand to match a clock
function thetaMinute() {
  thetaMinuteHand= ((minute()*360)/60)-90;
  return thetaMinuteHand;
}
//gives the angle that theta must be for a minute hand to match a clock

function thetaSecond() {
  thetaSecondHand=((((second()*360)/60))-90);
  return thetaSecondHand;
}
//gives the angle that theta must be for a second hand to match a clock
function thetaSun(){
  thetaSun=0;
  return thetaSun;
}
