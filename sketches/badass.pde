/* @pjs preload="feni_500X500.png"; */


float side; //side length of the image, w=h
float x; // x position of the image, top-left corner
float y; // y position of the image, top-left corner
//float a; //accelerazione
PImage fenicottero;

void setup(){
  size(500, 500);
  smooth();
  frameRate(20);
  imageMode(CENTER);
  fenicottero = loadImage("feni_500X500.png");
  side = 30;
  x = width/2;
  y = height/2;
  //a = 1.1;
}

void draw(){
  background(190);
  if (side < 1790) {
    x = x*1.1;
    image(fenicottero, x, y, side, side);
    side = side*1.1;
  } else {
    image(fenicottero, -50, 0, side, side);
  }
}
