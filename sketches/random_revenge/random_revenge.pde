// something2_randomrevenge project

// variables
float r;
float g;
float b;
float a;
float rectH;
float rectW;
float x;
float y;
int shape;
float triW;
float triH;


void setup() {
  size(900, 600);
  smooth();
  frameRate(30);
  background(255);
}

void draw() {

  // set all variables
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  rectH = random(300);
  rectW = (0.5*rectH+(sqrt(5)/2)*rectH);
  x = random(width);
  y = random(height);
  shape = int(random(3));
  triW = random(300);
  triH = random(300);


  if (shape == 1) {
    // draw rectangules!
    noStroke();
    fill(r, g, b, a);
    rect(x, y, rectW, rectH);
  } else if (shape == 2) {
    // draw ellipses
    noStroke();
    fill(r, g, b, a);
    ellipse(x, y, rectW, rectH);
  } else {
    // draw triangles
    noStroke();
    fill(r, g, b, a);
    triangle(x, y, x+triW, y, x+(triW/2), triH);
  }
}