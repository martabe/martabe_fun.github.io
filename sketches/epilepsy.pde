      //epilepsy

void setup() {
  size(500, 500);
  smooth();
  //frameRate(30);
  background(0);
}

void draw() {

  for (int x=0; 
    x<width; 
    x+=10) {
    for (int y=0; 
      y<height; 
      y+=10) {
      float r=random(255);
      float g=random(255);
      float b=random(255);
      stroke(255);
      fill(r, g, b);
      rect(x, y, 10, 10);
    }
  }
}