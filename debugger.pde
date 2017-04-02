Button startButton;
Button classicButton;
Button fancyButton;
Button photoButton;
Button inaniButton;
Button solvedButton;
Button unsolvedButton;
Button byeButton;
Button okayButton;

boolean mouseClickHappened = false;

boolean startB = false;
boolean classicB = false;
boolean fancyB = false;
boolean photoB = false;
boolean inaniB = false;
boolean solvedB = false;
boolean unsolvedB = false;
boolean byeB = false;
boolean okayB = false;

PFont font; //set variable for font
int savedTime;
int totalTime = 1500; //1.5 sec
int passedTime = millis() - savedTime;

void setup() {
  font= loadFont("CourierNewPSMT-18.vlw"); //load the font
  textFont(font);
  size(400, 647);
  smooth();
  //frameRate(4);
  background(230);
}

void draw() {

  //pg 1, starting page
  background(230);
  //display name
  fill(0);
  textAlign(LEFT);
  textSize(18);
  text("The * debugger", 
    20, (height-20) //x and y position of lower-left corner
    );


  //initialize startButton. Its boolean is startB
  int startButtonW = 100;
  int startButtonH = 62;
  int startButtonX = (width/2-startButtonW/2);
  int startButtonY = (height/2-startButtonH/2);

  startButton = new Button(
    startButtonX, //x position
    startButtonY, //y position
    startButtonW, startButtonH, 
    5, //corner rounding
    150, //filling color if OFF
    0, //stroke color if OFF
    150, //filling color if ON
    0, //stroke color if ON
    mouseClickHappened);

  startB = startButton.state(startB);

  //initialize classicButton, fancyButton, photoButton, inaniButton
  //measure for style buttons (classic, fancy, photo, inani)
  int styleButtonW = 100;
  int styleButtonH = 48;

  classicButton = new Button(
    50, //x position upper-left
    50-styleButtonH/2, //y position
    styleButtonW, styleButtonH, 
    5, //corner rounding
    200, //filling color if OFF
    0, //stroke color if OFF
    200, //filling color if ON
    0, //stroke color if ON
    mouseClickHappened);

  fancyButton = new Button(
    50, //x position upper-left
    150-styleButtonH/2, //y position
    styleButtonW, styleButtonH, 
    5, //corner rounding
    200, //filling color if OFF
    0, //stroke color if OFF
    200, //filling color if ON
    0, //stroke color if ON
    mouseClickHappened);

  photoButton = new Button(
    50, //x position upper-left
    250-styleButtonH/2, //y position
    styleButtonW, styleButtonH, 
    5, //corner rounding
    200, //filling color if OFF
    0, //stroke color if OFF
    200, //filling color if ON
    0, //stroke color if ON
    mouseClickHappened);

  inaniButton = new Button(
    50, //x position upper-left
    350-styleButtonH/2, //y position
    styleButtonW, styleButtonH, 
    5, //corner rounding
    200, //filling color if OFF
    0, //stroke color if OFF
    200, //filling color if ON
    0, //stroke color if ON
    mouseClickHappened);

  solvedButton = new Button(
    50, //x position upper-left
    350-styleButtonH/2, //y position
    styleButtonW, styleButtonH, 
    5, //corner rounding
    200, //filling color if OFF
    0, //stroke color if OFF
    200, //filling color if ON
    0, //stroke color if ON
    mouseClickHappened);

  unsolvedButton = new Button(
    250, //x position upper-left
    350-styleButtonH/2, //y position
    styleButtonW, styleButtonH, 
    5, //corner rounding
    200, //filling color if OFF
    0, //stroke color if OFF
    200, //filling color if ON
    0, //stroke color if ON
    mouseClickHappened);

  byeButton = new Button(
    250, //x position upper-left
    350-styleButtonH/2, //y position
    styleButtonW, styleButtonH, 
    5, //corner rounding
    200, //filling color if OFF
    0, //stroke color if OFF
    200, //filling color if ON
    0, //stroke color if ON
    mouseClickHappened);

  okayButton = new Button(
    250, //x position upper-left
    350-styleButtonH/2, //y position
    styleButtonW, styleButtonH, 
    5, //corner rounding
    200, //filling color if OFF
    0, //stroke color if OFF
    200, //filling color if ON
    0, //stroke color if ON
    mouseClickHappened);

  //display startButton
  startButton.display(startB);
  fill(0);
  textAlign(CENTER);
  textSize(18);
  text("Start", 
    startButtonX, 
    startButtonY+26, 
    startButtonW, 
    startButtonH
    );

  //if start is pressed
  if (startB) {
    //display page 2, choosing the debugger style

    //background settings
    background(255);
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


    classicB = classicButton.state(classicB);
    fancyB = fancyButton.state(fancyB);
    photoB = photoButton.state(photoB);
    inaniB = inaniButton.state(inaniB);

    //display classicButton, fancyButton, photoButton, inaniButton

    //display classicButton
    classicButton.display(classicB);
    fill(0);
    textAlign(CENTER);
    textSize(18);
    text("Classic", 
      50, //x position, lower-left
      (50-styleButtonH/2)+18, //y position, lower-left
      styleButtonW, 
      styleButtonH
      );

    //display fancyButton
    fancyButton.display(fancyB);
    fill(0);
    textAlign(CENTER);
    textSize(18);
    text("Fancy", 
      50, //lower-left
      (150-styleButtonH/2)+18, 
      styleButtonW, 
      styleButtonH
      );

    //display photoButton
    photoButton.display(photoB);
    fill(0);
    textAlign(CENTER);
    textSize(16);
    text("Photo- synthetic", 
      50, //lower-left
      (250-styleButtonH/2)+11, 
      styleButtonW, 
      styleButtonH
      );

    //display inaniButton
    inaniButton.display(inaniB);
    fill(0);
    textAlign(CENTER);
    textSize(16);
    text("Inanimate", 
      50, //lower-left
      (350-styleButtonH/2)+18, 
      styleButtonW, 
      styleButtonH
      );

    if (mouseClickHappened) {
      savedTime = millis();
    }
    mouseClickHappened = false;
  }

  //if start is true and one of the styles are pressed show page 3, only the text box with instructions
  if (startB &&
    classicB |
    fancyB |
    photoB |
    inaniB) {
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

    solvedB = solvedButton.state(solvedB);
    unsolvedB = unsolvedButton.state(unsolvedB);

    if (passedTime > 3*totalTime) {
      //display solvedButton
      solvedButton.display(solvedB);
      fill(0);
      textAlign(CENTER);
      textSize(16);
      text("Bug solved!", 
        50, //lower-left
        (350-styleButtonH/2)+11, 
        styleButtonW, 
        styleButtonH
        );


      //display unsolved button
      unsolvedButton.display(unsolvedB);
      fill(0);
      textAlign(CENTER);
      textSize(16);
      text("Bug unsolved.", 
        250, //lower-left
        (350-styleButtonH/2)+11, 
        styleButtonW, 
        styleButtonH
        );
    }

    //if solved button is pressed
    if (startB &&
      solvedB &&
      classicB |
      fancyB |
      photoB |
      inaniB) {
      background(255);
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

      byeB = byeButton.state(byeB);

      //display bye button
      byeButton.display(byeB);
      fill(0);
      textAlign(CENTER);
      textSize(16);
      text("Bye!", 
        250, //lower-left
        (350-styleButtonH/2)+18, 
        styleButtonW, 
        styleButtonH
        );
    } else if (startB &&
      unsolvedB &&
      classicB |
      fancyB |
      photoB |
      inaniB) {
      background(255);
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

      okayB = okayButton.state(okayB);

      //display okay button
      okayButton.display(okayB);
      fill(0);
      textAlign(CENTER);
      textSize(16);
      text("Okay", 
        250, //lower-left
        (350-styleButtonH/2)+18, 
        styleButtonW, 
        styleButtonH
        );
    }
    if (byeB | okayB) {
      //reset all variables
      startB = false;
      classicB = false;
      fancyB = false;
      photoB = false;
      inaniB = false;
      byeB = false;
      okayB = false;
      savedTime = millis();
    }

    mouseClickHappened = false;
    //startB = false;
  }

  //if start is true, and classic is pressed
  if (startB &&
    classicB) {
    //draw the duck
  }

  mouseClickHappened = false;
} //end of draw

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