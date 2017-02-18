Button unoButton;
Button dueButton;
boolean uno = false; // variabile T o F per il pulsante uno.
boolean due = false;
boolean mouseClickHappened = false;
// variables for the badass flamingo
float side; //side length of the image, w=h
float x; // x position of the image, top-left corner
float y; // y position of the image, top-left corner
int savedTime;
int totalTime = 500;

PFont font; //set the variable for font
PImage fenicottero;



void settings() {
  //fullScreen();
  //size(500, 500);
}

void setup() {
  size(500, 500);
  background(255);
  smooth();
  //frameRate(1);
  font= loadFont("CourierNewPSMT-48.vlw"); //load the font
  textFont(font);
  fenicottero = loadImage("feni_500X500.png");

  side = 30;
  x = (width/2)-(side/2);
  y = (height/2)-(side/2);
}

void draw() {
  background(190);
  fill(#C7F464);
  text("push a button", 50, (height/2)-48);
/*
  unoButton = new Button(
    50, 50, // x and y position
    70, 30, // width and height
    5, //corner rounding
    #556270, //filling color if OFF
    #FFFFFF, //stroke color if OFF
    #4ECDC4, //filling color if ON
    #FFFFFF, //stroke color if ON
    mouseClickHappened);

  dueButton = new Button(
    (50+70+50), 50, 
    70, 30, 
    5, 
    #C44D58, 
    #FFFFFF, 
    #FF6B6B, 
    #FFFFFF, 
    mouseClickHappened);


  uno = unoButton.state(uno);
  due = dueButton.state(due);


  if (uno) {
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

  if (due) {
    background(190);
    if (side < 1790) {
      x = x*0.9;
      y = y*0.9;
      image(fenicottero, x, y, side, side);
      side = side*1.1;
      savedTime = millis();
    } else {
      background(190);
      //calculate how much time has passed
      int passedTime = millis() - savedTime;
      image(fenicottero, -50, 0, 1790, 1790);
      // has one second passed?
      if (passedTime > totalTime) {
        fill(#C7F464);
        text("PUSH", 50, (height/2)-48);
      }
      if (passedTime > 2*totalTime) {
        fill(#C7F464);
        text("IT", 50, height/2);
      }
      if (passedTime > 3*totalTime) {
        fill(#C7F464);
        text("BACK", 50, (height/2)+48);
      }
      if (passedTime > 4*totalTime) {
        fill(#556270);
        text("the badass flamingo", 10, height-48);
      }
    }
  } else {
    side = 30;
    x = (width/2)-(side/2);
    y = (height/2)-(side/2);
  }

  unoButton.display(uno);
  dueButton.display(due);
  mouseClickHappened = false;
}
*/
void mouseClicked() {
  mouseClickHappened = true;
}

class Button {
  float x; //x position of the button
  float y; //y position of the button
  float w; //width of the button
  float h; //height of the button
  float r; //arrotondamento angoli
  color fillOFF; //filling color if OFF
  color strokeOFF; //stroke color if OFF
  color fillON; //filling color if ON
  color strokeON; //stroke color if ON
  boolean mouseClickHappened;

  Button(float tempX, float tempY, float tempW, float tempH, float tempR, 
    color tempFillOFF, color tempStrokeOFF, 
    color tempFillON, color tempStrokeON, boolean tempMouseClickHappened) {
    x=tempX;
    y=tempY;
    w=tempW;
    h=tempH;
    r=tempR;
    fillOFF=tempFillOFF;
    strokeOFF=tempStrokeOFF;
    fillON=tempFillON;
    strokeON=tempStrokeON;
    mouseClickHappened=tempMouseClickHappened;
  }


  //funzione che comunica lo stato dell'interruttore
  boolean state(boolean state) {
    if (mouseClickHappened &&
      mouseOver(x, y, w, h)) {
      state = !state;
    }
    return state;
  }


  // funzione che mostra il pulsante
  void display(boolean ON) {
    if (ON
    ) {
      drawButton(x, y, w, h, r, fillON, strokeON);
    } else {
      drawButton(x, y, w, h, r, fillOFF, strokeOFF);
    }
  }
}

// funzione che definisce se il mouse è sopra il pulsante
boolean mouseOver(float x, float y, float w, float h) {
  boolean overON;
  if (mouseX >x &&
    mouseX <(x+w) &&
    mouseY >y &&
    mouseY <(y+h)
    ) {
    overON = true;
  } else {
    overON = false;
  }
  return overON;
}

// drawButton function
void drawButton(float x, float y, float w, float h, float r, 
  color fill, color stroke) { //r is for radii of every corner
  fill(fill);
  stroke(stroke);
  strokeWeight(2);
  rect(x, y, w, h, r);
}