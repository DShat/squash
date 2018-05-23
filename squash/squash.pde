int paddleX = 50;
int paddleY = 8*height/3;
int paddleWidth = 20;
int paddleHeight = 150;
int paddleSpeed = 15;

boolean up, down;

int backgroundColour1[], backgroundColour2[];
float bgColourmodifier;

int bG1[], bG2[];

int i;

void setup() { 
  size(700, 580);
  frameRate(20);
  bG1 = new int[10];
  for (int q=0; q<bG1.length; q+=1) {
    bG1[q] = (q*10);
  }
  bG2 = new int[10];
  for (int q=0; q<bG2.length; q+=1) {
    bG2[q] = (255-q*10);
  }
  backgroundColour1 = new int[10];
  for (int q=0; q<backgroundColour1.length; q++) {
    backgroundColour1[q] = color(bG1[q], bG1[q], bG1[q]);
  }
  backgroundColour2 = new int[10];
  for (int q=0; q<backgroundColour1.length; q++) {
    backgroundColour2[q] = color(bG2[q], bG2[q], bG2[q]);
  }
}
void draw() {
  background(0);
  backgroundGradients();
  theWall();
  drawPaddle();
  movePaddle();
  restrictPaddle();
}

void backgroundGradients() {
  int bgNumber = 1;
  int opacity = 255;
  int theLight = width/4;
  i=0;
  bgColourmodifier=0;
  while (i<theLight) {
    fill(lerpColor(backgroundColour2[bgNumber], backgroundColour1[bgNumber], bgColourmodifier), opacity);
    noStroke();
    rect(i, 0, i+25, height, 0.25);
    i+=1;
    bgColourmodifier+=0.0085;
  }
}

void drawPaddle() {
  fill(#00FFFF);
  noStroke();
  rect(paddleX, paddleY, paddleWidth, paddleHeight);
}

void movePaddle() {
  if (up) {
    paddleY-=paddleSpeed;
  } else if (down) {
    paddleY+=paddleSpeed;
  }
}

void restrictPaddle() {
  if (paddleY - paddleHeight/2<-79) {
    paddleY += paddleSpeed;
  }
  if (paddleY + paddleHeight/2>height) {
    paddleY -= paddleSpeed;
  }
}

void theWall() {
  noStroke();
  fill(#FF0000);
  rect(width-100, 0, width, height);
}

void keyPressed() {
  if (key == 'w'|| key == 'W') {
    up = true;
  } 
  if (key == 's'||key == 'S') {
    down = true;
  }
}
void keyReleased() {
  if (key == 'w'|| key == 'W') {
    up = false;
  } 
  if (key == 's'||key == 'S') {
    down = false;
  }
}