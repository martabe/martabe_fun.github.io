class Frog {
  float x; // x position of face ellipse center
  float y; // y position of face ellipse center
  float size; // half of the major diameter of face ellipse

  Frog(float tempx, float tempy, float tempsize) {
    x=tempx;
    y=tempy;
    size=tempsize;
  }

  void display() {
    //face
    noStroke();
    fill(177, 205, 2);
    ellipse(x, 
      y, 
      2*size, 
      2*size/1.618);
    ellipse(x+size, 
      y, 
      size/6, 
      size/6);
    ellipse(x-size, 
      y, 
      size/6, 
      size/6);

    //mouth
    stroke(133, 36, 102);
    strokeWeight(1.2);
    noFill();
    line(x-0.8*size, 
      y, 
      x+0.8*size, 
      y);
    fill(133, 36, 102);
    ellipse(x, y, 0.01*size, 0.01*size);

    //nose
    fill(133, 36, 102);
    noStroke();
    ellipse(x-0.1*size, 
      y-0.2*size, 
      0.02*size, 
      0.02*size);
    ellipse(x+0.1*size, 
      y-0.2*size, 
      0.02*size, 
      0.02*size);

    //left eye
    stroke(133, 36, 102);
    fill(0, 224, 185);
    ellipse(x-0.5*size, 
      y-0.5*size, 
      0.6*size, 
      0.6*size);
    fill(133, 36, 102);
    ellipse(x-0.5*size, 
      y-0.5*size, 
      0.05*size, 
      0.05*size);

    //right eye
    stroke(133, 36, 102);
    fill(248, 35, 95);
    ellipse(x+0.47*size, 
      y-0.55*size, 
      0.3*size, 
      0.3*size);
    fill(133, 36, 102);
    ellipse(x+0.45*size, 
      y-0.53*size, 
      0.05*size, 
      0.05*size);
  }
}
class Circles {
  float x; // x position of center
  float y; // y position of center
  float sizeC; // radium of the biggest circle
  int cn;

  Circles(int tempcn, float tempx, float tempy, float tempsizeC) {
    cn=tempcn;
    x=tempx;
    y=tempy;
    sizeC=tempsizeC;
  }

  void display() {
    for (float i=sizeC*4; i>1; i=(i-sizeC/10)) {
      noStroke();
      if (cn==1) {
        fill(177, 205, 2);
      } else if (cn==2) {
        fill(61, 191, 52);
      } else if (cn==3) {
        fill(0, 224, 185);
      } else if (cn==4) {
        fill(133, 36, 102);
      } else if (cn==5) {
        fill(248, 35, 95);
        cn=0;
      }
      ellipse(x, y, i, i);
      cn++;
    }
  }
}
Frog myFrog1;
Frog myFrog2;
Circles myCircles;
float dimen=1;
int i=0;
float fr=59; // frame rate for concentric circles
int n=1; // counter for concentric circles
float r=1; //radius of final circle

void setup() {
  size(800, 800);
  background(255);
  smooth();
  //frameRate(40);
}

void draw() {
  if (r<width) {
    if (dimen <= (width*200)) {
      myFrog1= new Frog(width/2, height/2, dimen);
      myFrog1.display();
      dimen=dimen*1.05;
    } else {    
      if (i<200) { //i< numero di rane apparse
        frameRate(30);
        float xFrog2=random(-50, width+50);
        float yFrog2=random(-50, height+50);
        myFrog2= new Frog(xFrog2, yFrog2, 120);
        myFrog2.display();
        i++;
      } else {
        frameRate(fr);
        if (fr<10) {
          fr=60;
        } else if (fr==60) {
          fill(248, 35, 95);
          noStroke();
          ellipse(width/2, height/2, r, r);
          r*=1.1;
        } else {
          if (n<5) {
            myCircles = new Circles(n, width/2, height/2, width/2);
            myCircles.display();
            n++;
          } else {
            myCircles = new Circles(n, width/2, height/2, width/2);
            myCircles.display();
            n=1;
          }
          fr=0.98*fr;
        }
      }
    }
  } else {
    r=1;
    dimen=1;
    i=0;
    fr=59;
    n=1;
  }
}