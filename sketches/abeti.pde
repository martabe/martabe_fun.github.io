      // abeti

// variables
float lawny; //lawn y position
boolean Abutton = false; // Abutton is button "Abeti"
boolean Nbutton = false; // Nbutton is button "Nuvole"
float Abuttonx; //posizione del bottone abeti
float Abuttony;
float Abuttonw; //dimensioni del bottone abeti
float Abuttonh;
float Nbuttonx; //posizione del bottone nuvole
float Nbuttony;
float Nbuttonw; //dimensioni del bottone nuvole
float Nbuttonh;




void setup() {
  size(900, 600);
  smooth();
  frameRate(4);
  background(137, 252, 255);
  //draw the lawn
  lawny=height*2/3;
  noStroke();
  fill(168, 231, 87);
  rect(0, lawny, width, height-lawny);
  Abuttonx = 50;
  Abuttony = Abuttonx;
  Abuttonw = 80;
  Abuttonh = 40;
  Nbuttonx = 180;
  Nbuttony = Abuttony;
  Nbuttonw = 80;
  Nbuttonh = 40;
}

void draw() {
  drawAbutton();
  drawNbutton();
  // Abeti button
  if (Abutton) {
    abete();
  } 
  //Nuvole button
  if (Nbutton) {
    cloud();
  }
}
void mousePressed() {
  if (
    mouseX > Abuttonx &&
    mouseX < (Abuttonx+Abuttonw) &&
    mouseY > Abuttony &&
    mouseY < (Abuttony+Abuttonh) ) {
    Abutton = !Abutton;
  } else if (
    mouseX > Nbuttonx &&
    mouseX < (Nbuttonx+Nbuttonw) &&
    mouseY > Nbuttony &&
    mouseY < (Nbuttony+Nbuttonh) ) {
    Nbutton = !Nbutton;
  }
}

// draw abete function
void abete() {
  float l; //raggio del tronco
  float h; //altezza del tronco
  float x; // x centro base del tronco
  float y; // y centro base del tronco

  l = random(10, 15);
  h = l*2;
  x = random(width);
  y = random(lawny, height);

  // draw stem
  noStroke();
  fill(42, 67, 9);
  rect(x-l, y-h, 2*l, 2*h);

  // draw triangles
  // big one
  noStroke();
  fill(72, 107, 27);
  triangle(
    x-4*l, y-h, 
    x+4*l, y-h, 
    x, y-h-4*l*sqrt(3)
    );

  // small one
  noStroke();
  fill(104, 149, 45);
  triangle(
    x-3*l, y-h-(4*l*sqrt(3))*2/3, 
    x+3*l, y-h-(4*l*sqrt(3))*2/3, 
    x, y-h-(4*l*sqrt(3))*2/3-3*l*sqrt(3)
    );
}

// draw a cloud function
void cloud() {
  float ellix;
  float elliy;
  float elliw;
  float ellih;
  float elli2x; //ellisse 2 per nuvola
  float elli2y;
  float elli2w;
  float elli2h;
  ellix = random(0, width);
  elliy = random(0, height/3);
  elliw = random(25, 100);
  ellih = elliw*2/3;
  elli2x = ellix+elliw/2;
  elli2y = elliy+ellih/4;
  elli2w = elliw/2;
  elli2h = ellih/2;
  // draw first ellipse
  noStroke();
  fill(220, 232, 232);
  ellipse(ellix, elliy, elliw, ellih);
  //draw second ellipse
  noStroke();
  fill(220, 232, 232);
  ellipse(elli2x, elli2y, elli2w, elli2h);
}

// draw abete button function
void drawAbutton() {
  // Abeti button
  stroke(81, 149, 72);
  fill(190, 242, 2);
  rect(Abuttonx, Abuttony, Abuttonw, Abuttonh);
}

// draw cloud button function
void drawNbutton() {
  // Nuvole button
  stroke(73, 176, 242);
  fill(168, 216, 245);
  rect(Nbuttonx, Nbuttony, Nbuttonw, Nbuttonh);
}
</html>