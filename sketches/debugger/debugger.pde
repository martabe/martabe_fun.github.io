Button startButton;
Button classicButton;
Button fancyButton;
Button photoButton;
Button inaniButton;
Button solvedButton;
Button unsolvedButton;
Button byeButton;
Button okayButton;

boolean status_pg1 = true; //start page
boolean status_pg2 = false; // choose the debugger
boolean status_pg3 = false; // debugging page
boolean classic = false;
boolean fancy = false;
boolean photo = false;
boolean inani = false;
boolean solved = false;
boolean unsolved = false;
boolean mouseOver = false;
boolean clicked = false;


PImage duck;
PImage fenicottero;
PImage leaf;
PImage idrante;
PFont font; //set variable for font
int savedTime;
int totalTime = 1500; //1.5 sec
int passedTime = millis() - savedTime;
int imageX = 50;
int imageY = 50;
int imageW = 300;
int imageH = 300;

void setup() {
  font= loadFont("CourierNewPSMT-18.vlw"); //load the font
  duck = loadImage("duck.png");
  fenicottero = loadImage("fenicottero.png");
  leaf = loadImage("leaf.png");
  idrante = loadImage("idrante.png");
  textFont(font);
  size(400, 647);
  smooth();
  //frameRate(4);
  background(30);
}

void draw() {
  //initialize startButton.
  int startButtonW = 100;
  int startButtonH = 62;
  int startButtonX = (width/2-startButtonW/2);
  int startButtonY = (height/2-startButtonH/2);

  startButton = new Button(
    startButtonX, //x position
    startButtonY, //y position
    startButtonW, startButtonH, 
    5, //corner rounding
    150, //filling color
    0 //stroke color
    );

  //initialize classicButton, fancyButton, photoButton, inaniButton
  //measure for style buttons (classic, fancy, photo, inani)
  int styleButtonW = 100;
  int styleButtonH = 48;

  classicButton = new Button(
    50, //x position upper-left
    50-styleButtonH/2, //y position
    styleButtonW, styleButtonH, 
    5, //corner rounding
    200, //filling color
    0 //stroke color
    );

  fancyButton = new Button(
    50, //x position upper-left
    150-styleButtonH/2, //y position
    styleButtonW, styleButtonH, 
    5, //corner rounding
    200, //filling color
    0//stroke color
    );

  photoButton = new Button(
    50, //x position upper-left
    250-styleButtonH/2, //y position
    styleButtonW, styleButtonH, 
    5, //corner rounding
    200, //filling color
    0 //stroke color
    );

  inaniButton = new Button(
    50, //x position upper-left
    350-styleButtonH/2, //y position
    styleButtonW, styleButtonH, 
    5, //corner rounding
    200, //filling color
    0 //stroke color
    );

  solvedButton = new Button(
    50, //x position upper-left
    350-styleButtonH/2, //y position
    styleButtonW, styleButtonH, 
    5, //corner rounding
    200, //filling color
    0 //stroke color
    );

  unsolvedButton = new Button(
    250, //x position upper-left
    350-styleButtonH/2, //y position
    styleButtonW, styleButtonH, 
    5, //corner rounding
    200, //filling color
    0 //stroke color
    );

  byeButton = new Button(
    250, //x position upper-left
    350-styleButtonH/2, //y position
    styleButtonW, styleButtonH, 
    5, //corner rounding
    200, //filling color
    0 //stroke color
    );

  okayButton = new Button(
    250, //x position upper-left
    350-styleButtonH/2, //y position
    styleButtonW, styleButtonH, 
    5, //corner rounding
    200, //filling color
    0 //stroke color
    );

  if (status_pg1) {
    classic = false;
    fancy = false;
    photo = false;
    inani = false;
    background(230);
    //display name
    fill(0);
    textAlign(LEFT);
    textSize(18);
    text("The * debugger", 
      20, (height-20) //x and y position of lower-left corner
      );

    startButton.drawButton();
    fill(0);
    textAlign(CENTER);
    textSize(18);
    text("Start", 
      startButtonX, 
      startButtonY+26, 
      startButtonW, 
      startButtonH
      );
    if (startButton.checkMouseOver() &&
      clicked) {
      clicked = false;
      status_pg1 = false;
      status_pg2 = true;
      status_pg3 = false;
    }
  }
  if (status_pg2) {
    //display page 2, choosing the debugger style
    background(255); //background settings
    //the text box
    fill(230);
    noStroke();
    rect(0, width, width, height-width);
    stroke(0);
    line(0, width, width, width);
    //display instructions in textbox
    fill(0);
    textAlign(LEFT);
    textSize(16);
    text("> Choose the style of the debugger.", 
      20, (width+20), //x and y position of lower-left corner
      (width-40), (height-width-40)
      );
    classicButton.drawButton();
    fill(0);
    textAlign(CENTER);
    textSize(18);
    text("Classic", 
      50, //x position, lower-left
      (50-styleButtonH/2)+18, //y position, lower-left
      styleButtonW, 
      styleButtonH
      );
    fancyButton.drawButton();
    fill(0);
    textAlign(CENTER);
    textSize(18);
    text("Fancy", 
      50, //lower-left
      (150-styleButtonH/2)+18, 
      styleButtonW, 
      styleButtonH
      );
    photoButton.drawButton();
    fill(0);
    textAlign(CENTER);
    textSize(16);
    text("Photo- synthetic", 
      50, //lower-left
      (250-styleButtonH/2)+8, 
      styleButtonW, 
      styleButtonH
      );
    inaniButton.drawButton();
    fill(0);
    textAlign(CENTER);
    textSize(16);
    text("Inanimate", 
      50, //lower-left
      (350-styleButtonH/2)+18, 
      styleButtonW, 
      styleButtonH
      );
    if (classicButton.checkMouseOver() &&
      clicked) {
      clicked = false;
      status_pg1 = false;
      status_pg2 = false;
      status_pg3 = true;
      classic = true;
    } else if (fancyButton.checkMouseOver() &&
      clicked) {
      clicked = false;
      status_pg1 = false;
      status_pg2 = false;
      status_pg3 = true;
      fancy = true;
    } else if (photoButton.checkMouseOver() &&
      clicked) {
      clicked = false;
      status_pg1 = false;
      status_pg2 = false;
      status_pg3 = true;
      photo = true;
    } else if (inaniButton.checkMouseOver() &&
      clicked) {
      clicked = false;
      status_pg1 = false;
      status_pg2 = false;
      status_pg3 = true;
      inani = true;
    }
  }
  if (status_pg3) {
    //redo background, draw the textbox and write instructions
    passedTime = millis() - savedTime;
    //background settings
    background(255);

    if (passedTime < totalTime) {
      //text box
      fill(230);
      noStroke();
      rect(0, width, width, height-width);
      stroke(0);
      line(0, width, width, width);

      //display instructions in textbox
      fill(0);
      textAlign(LEFT);
      textSize(16);
      text("> Hello!", 
        20, (width+20), //x and y position of lower-left corner
        (width-40), (height-width-40)
        );
    } else if (passedTime > totalTime &&
      passedTime < 2*totalTime) {
      //text box
      fill(230);
      noStroke();
      rect(0, width, width, height-width);
      stroke(0);
      line(0, width, width, width);

      //display instructions in textbox
      fill(0);
      textAlign(LEFT);
      textSize(16);
      text("> Hello! Please, tell me about your code!", 
        20, (width+20), //x and y position of lower-left corner
        (width-40), (height-width-40)
        );
    } else if (passedTime > 2*totalTime) {
      //text box
      fill(230);
      noStroke();
      rect(0, width, width, height-width);
      stroke(0);
      line(0, width, width, width);

      //display instructions in textbox
      fill(0);
      textAlign(LEFT);
      textSize(16);
      text("> Hello! Please, tell me about your code! I will carefully listen.", 
        20, (width+20), //x and y position of lower-left corner
        (width-40), (height-width-40)
        );
    }
    if (passedTime > 3*totalTime) {
      //display solvedButton
      solvedButton.drawButton();
      fill(0);
      textAlign(CENTER);
      textSize(16);
      text("Bug solved!", 
        50, //lower-left
        (350-styleButtonH/2)+16, 
        styleButtonW, 
        styleButtonH
        );
      //display unsolved button
      unsolvedButton.drawButton();
      fill(0);
      textAlign(CENTER);
      textSize(16);
      text("Bug unsolved.", 
        250, //lower-left
        (350-styleButtonH/2)+8, 
        styleButtonW, 
        styleButtonH
        );
    }
    if (solvedButton.checkMouseOver() &&
      clicked) {
      clicked = false;
      status_pg1 = false;
      status_pg2 = false;
      status_pg3 = false;
      solved = true;
    } else if (unsolvedButton.checkMouseOver() &&
      clicked) {
      clicked = false;
      status_pg1 = false;
      status_pg2 = false;
      status_pg3 = false;
      unsolved = true;
    }
  }
  if (solved) {
    //text box
    fill(230);
    noStroke();
    rect(0, width, width, height-width);
    stroke(0);
    line(0, width, width, width);

    //display instructions in textbox
    fill(0);
    textAlign(LEFT);
    textSize(16);
    text("> Congrats! I'm happy I've been useful. Take care and goodbye!", 
      20, (width+20), //x and y position of lower-left corner
      (width-40), (height-width-40)
      );
    //display bye button
    byeButton.drawButton();
    fill(0);
    textAlign(CENTER);
    textSize(16);
    text("Bye!", 
      250, //lower-left
      (350-styleButtonH/2)+18, 
      styleButtonW, 
      styleButtonH
      );
    if (byeButton.checkMouseOver() &&
      clicked) {
      clicked = false;
      status_pg1 = true;
      status_pg2 = false;
      status_pg3 = false;
      solved = false;
    }
  } else if (unsolved) {
    //text box
    fill(230);
    noStroke();
    rect(0, width, width, height-width);
    stroke(0);
    line(0, width, width, width);

    //display instructions in textbox
    fill(0);
    textAlign(LEFT);
    textSize(16);
    text("> Go take a walk, a coffee, a nap, and try again later. It will be better. See you later!", 
      20, (width+20), //x and y position of lower-left corner
      (width-40), (height-width-40)
      );
    //display okay button
    okayButton.drawButton();
    fill(0);
    textAlign(CENTER);
    textSize(16);
    text("Okay", 
      250, //lower-left
      (350-styleButtonH/2)+18, 
      styleButtonW, 
      styleButtonH
      );
    if (okayButton.checkMouseOver() &&
      clicked) {
      clicked = false;
      status_pg1 = true;
      status_pg2 = false;
      status_pg3 = false;
      unsolved = false;
    }
  }
  if (classic) {
    image(duck, imageX+25, imageY+25, imageW-50, imageH-50);
  }
  if (fancy) {
    image(fenicottero, imageX, imageY, imageW, imageH);
  }
  if (photo) {
    image(leaf, imageX, imageY, imageW, imageH);
  }
  if (inani) {
    image(idrante, imageX, imageY, imageW, imageH);
  }
}

void mouseReleased() {
  clicked = true;
  savedTime = millis();
}



class Button {
  float x; //x position of the button
  float y; //y position of the button
  float w; //width of the button
  float h; //height of the button
  float r; //arrotondamento angoli
  color fill_colour; //filling color
  color stroke_colour; //stroke color

  Button(float tempX, float tempY, float tempW, float tempH, float tempR, 
    color tempFill, color tempStroke) {
    x=tempX;
    y=tempY;
    w=tempW;
    h=tempH;
    r=tempR;
    fill_colour=tempFill;
    stroke_colour=tempStroke;
  }

  boolean checkMouseOver() {
    boolean state = false;
    if (mouseX > x &&
      mouseX < x + w &&
      mouseY > y &&
      mouseY < y + h) {
      state = true;
    }
    return state;
  }

  // funzione che mostra il pulsante
  void drawButton() { //r is for radii of every corner
    fill(fill_colour);
    stroke(stroke_colour);
    strokeWeight(2);
    rect(x, y, w, h, r);
  }
}