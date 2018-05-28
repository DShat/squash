int paddleX = 75;
int paddleY = height/2;
int paddleWidth = 20;
int paddleHeight = 150;
int paddleSpeed = 10;

int ballX, ballY, ballHeight, ballWidth;

int xSpeed, ySpeed;

boolean up, down;

int backgroundColour1[], backgroundColour2[];
float bgColourmodifier;

int bG1[], bG2[];

int i;

int score = 0;

void setup() { 
  size(700, 580);
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
  ballX = width/2;
  ballY = height/2;
  ballWidth = 50;
  ballHeight = 50;
  xSpeed = 5;
  ySpeed = 4;
  backgroundGradients();
}

void draw() {
  normalMode();
}

void normalMode() {
  background(0);

  theWall();
  drawPaddle();
  movePaddle();
  restrictPaddle();
  drawBall();
  moveBall();
  ballBounce();
  paddleBounce();
  gameOver();
  scores();
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
    rect(i, 0, i+2, height, 0.25);
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
  if (paddleY < 0) {
    paddleY += paddleSpeed;
  }
  if (paddleY + paddleHeight > height) {
    paddleY -= paddleSpeed;
  }
}

void drawBall() {
  fill(#ffffff);
  ellipse(ballX, ballY, ballWidth, ballHeight);
}

void moveBall() {
  ballX+= xSpeed;
  ballY+= ySpeed;
}

void theWall() {
  noStroke();
  fill(#FF0000);
  rect(width-100, 0, width, height);
}

void ballBounce() {
  if (ballX > width-100 - ballWidth/2) {
    xSpeed = -xSpeed;
  }
  if (ballY > height - ballHeight/2) {
    ySpeed = -ySpeed;
  } else if (ballY < ballHeight/2) {
    ySpeed = -ySpeed;
  }
}

void paddleBounce() {
  if (ballX - ballWidth/2 < paddleX + paddleWidth/2 && ballY - ballHeight/2 < paddleY + paddleHeight && ballY + ballHeight/2 > paddleY) { 
    if (xSpeed < 0) {
      xSpeed = -xSpeed*119/100;
      score++;
    }
  }
}

void gameOver() {
  if (ballX - ballWidth/2< 0) {
    xSpeed = 0;
    ySpeed = 0;
    if (score < 10) {
      text("you suck >:]", 100, 300);
    } else if (score < 20 && score >= 10) {
      text("git gud", 100, 300);
    } else if (score < 50 && score >= 20) {
      text("not bad", 100, 300);
    } else if (score < 100 && score >= 50) {
      text("waow", 100, 300);
    } else if (score >= 100) {
      textSize(20);
      text("waow u so cool", width/2-100, 300);
      textSize(7);
      text("like Mr Gallo", width/2-100, 325);
    }
  }
}
void scores() {
  textSize(100);
  fill(255);
  text(score, width/2, 100);
}

void keyPressed() {
  if (key == 'w'|| key == 'W') {
    up = true;
  } 
  if (key == 's'|| key == 'S') {
    down = true;
  }
}
void keyReleased() {
  if (key == 'w'|| key == 'W') {
    up = false;
  } 
  if (key == 's'|| key == 'S') {
    down = false;
  }
}
void mousePressed() {
  setup();
}
