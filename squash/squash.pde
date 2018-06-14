float paddleX, paddleY, paddleY2, paddleWidth, paddleHeight, paddleSpeed;

float ballX, ballY, ballX2, ballY2, ballHeight, ballWidth;

double xSpeed, xSpeed2, ySpeed, ySpeed2;

double xSpeedN, ySpeedN, xSpeedI, ySpeedI;

boolean up, up2, down, down2;

int score, score2, score3; 

int bg[]; 

int screen = 0;
int bigFont = 48;
int mediumFont = 28;
int smallFont= 20;

float mouseLoc;

int normalDiffScreen = 1;
int infernalDiffScreen = 2;
int randomDiffScreen = 3;
int pongScreen = 4;
int coopScreen = 5;
int randomPongScreen = 6;

PImage img, img2;

void setup() { 
  size(700, 580);
  img = loadImage("angery.png");
  img2 = loadImage("awesomeface.png");
  bg = new int[6];
  bg[0] = #1ACB00;
  bg[1] = #AF02F0;
  bg[2] = #FF95D0;
  bg[3] = #000000;
  bg[4] = #FFBC00;
  bg[5] = #83DB00;
  paddleX = 75;
  paddleY = height/2;
  paddleY2 = height/2;
  paddleWidth = 20;
  paddleHeight = 150;
  paddleSpeed = 10;
  ballX = width/2;
  ballX2 = 3*width/4;
  ballY = height/2;
  ballY2 = height/4;
  ballWidth = 50;
  ballHeight = 50;
  xSpeed = 5;
  xSpeed2 = 3;
  ySpeed = 4;
  ySpeed2 = 4; 
  xSpeedN = 105/100;
  ySpeedN = 104/100;
  score = 0;
}

void draw() {
  screen();
}

void normalMode() {
  background(bg[0]);
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

void infernalMode() {
  background(bg[1]);
  theWall();
  paddleHeight = 200;
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
void randomMode() {
  background(bg[2]);
  seizureBackground();
  theWall();
  drawPaddle();
  movePaddle();
  restrictPaddle();
  drawBall();
  moveBall();
  ballBounceRandom();
  paddleBounce();
  gameOver();
  scores();
}
void pongMode() {
  background(bg[3]);
  drawPaddle();
  movePaddle();
  restrictPaddle();
  drawBall();
  moveBall();
  ballBounce();
  ballReset();
  paddleBouncePong();
  gameOverPong();
  scores();
}

void coopMode() {
  background(bg[4]);
  theWall();
  drawPaddle();
  movePaddle();
  restrictPaddle();
  ballHeight = 35;
  ballWidth = 35;
  drawBall();
  moveBall();
  ballBounce();
  paddleBounceCoop();
  gameOver();
  scores();
}

void randomPongMode(){
background(bg[5]);
  drawPaddle();
  movePaddle();
  restrictPaddle();
  drawBall();
  moveBall();
  ballBounceRandom();
  ballReset();
  paddleBounceRandomPong();
  gameOverPong();
  scores();
}
void drawPaddle() {
  fill(#00FFFF);
  noStroke();
  rect(paddleX, paddleY, paddleWidth, paddleHeight);
  if (screen == coopScreen) {
    fill(#FFFF00);
    rect(paddleX+50, paddleY2, paddleWidth, paddleHeight);
  }
  if (screen == pongScreen || screen == randomPongScreen) {
    fill(#FF0000);
    rect(paddleX+550, paddleY2, paddleWidth, paddleHeight);
  }
}

void movePaddle() {
  if (up) {
    paddleY-=paddleSpeed;
  } else if (down) {
    paddleY+=paddleSpeed;
  }
  if (screen == coopScreen || screen == pongScreen || screen == randomPongScreen) {
    if (up2) {
      paddleY2 -= paddleSpeed;
    } else if (down2) {
      paddleY2 += paddleSpeed;
    }
  }
}



void restrictPaddle() {
  if (paddleY < 0) {
    paddleY += paddleSpeed;
  }
  if (paddleY + paddleHeight > height) {
    paddleY -= paddleSpeed;
  }
  if (screen == coopScreen || screen == pongScreen || screen == randomPongScreen) {
    if (paddleY2 < 0) {
      paddleY2 += paddleSpeed;
    }
    if (paddleY2 + paddleHeight > height) {
      paddleY2 -= paddleSpeed;
    }
  }
}

void drawBall() {
  fill(#ffffff);
  ellipse(ballX, ballY, ballWidth, ballHeight);
  if (screen == coopScreen) {
    ellipse(ballX2, ballY2, ballWidth, ballHeight);
  }
}

void moveBall() {
  ballX += xSpeed;
  ballY += ySpeed;
  if (screen == coopScreen) {
    ballX2 += xSpeed2;
    ballY2 += ySpeed2;
  }
}

void theWall() {
  noStroke();
  fill(#FF0000);
  rect(width-100, 0, width, height);
  image(img, 600, 230, 100, 100);
  if (screen == randomDiffScreen) {
    image (img2, 600, 230, 100, 100);
  }
  if (screen == randomDiffScreen) {
    if (score % 4 == 0) {
      image(img, 600, 230, 100, 100);
    } else {
      image (img2, 600, 230, 100, 100);
    }
  }
}

void ballBounce() {
  if (ballY >= height - ballHeight/2) {
    ySpeed = -ySpeed;
  } else if (ballY - ballHeight/2 < 0) {
    ySpeed = -ySpeed;
  }
  if (screen  != pongScreen && screen != randomPongScreen) {
    if (ballX > width-100 - ballWidth/2) {
      xSpeed = -xSpeed;
    }
  }
  if (screen == coopScreen) {
    if (ballX2 >= width-100 - ballWidth/2) {
      xSpeed2 = -xSpeed2;
    }
    if (ballY2 >= height - ballHeight/2) {
      ySpeed2 = -ySpeed2;
    } else if (ballY2 - ballHeight/2 < 0) {
      ySpeed2 = -ySpeed2;
    }
  }
}
void ballBounceRandom() {
  if (screen != randomPongScreen){
  if (ballX > width-100 - ballWidth/2) {
    xSpeed = -random(3, 13);
    ySpeed = random(-10, 10);
    if (xSpeed >= 16) {
      xSpeed = random(-16, 16);
      if (xSpeed <= 5 && xSpeed >= 0) {
        xSpeed = 5;
      }
    }
    if (ySpeed >= 10) {
      ySpeed = random(-10, 10);
      if (ySpeed <=2 && ySpeed >= 0) {
        ySpeed = 3;
      }
      if (ySpeed >= -2 && ySpeed <= 0) {
        ySpeed = -3;
      }
    }
  }
  }
  if (ballY >= height - ballHeight/2) {
    ySpeed = -random(3, 10);
    xSpeed = random(-10, 10);
    if (xSpeed <= 3 && xSpeed >= 0) {
      xSpeed =3;
    }
    if (xSpeed >= -3 && xSpeed <= 0) {
      xSpeed = -3;
    }
  } else if (ballY - ballHeight/2 < 0) {
    ySpeed = random(3, 10);
    xSpeed = random(-10, 10);
    if (xSpeed <= 3 && xSpeed >= 0) {
      xSpeed =3;
    }
    if (xSpeed >= -3 && xSpeed <= 0) {
      xSpeed = -3;
    }
  }
}
void paddleBounce() {
  if (ballX - ballWidth/2 > paddleX && ballX - ballWidth/2 < paddleX + paddleWidth/2 && ballY - ballHeight/2 < paddleY + paddleHeight && ballY + ballHeight/2 > paddleY) { 
    if (screen == normalDiffScreen) {
      xSpeed = -xSpeed*105/100;
      ySpeed = ySpeed*104/100;
    }
    if (screen == infernalDiffScreen) {
      xSpeed = -xSpeed*108/100;
      ySpeed = ySpeed*107/100;
    }
    if (screen == randomDiffScreen) {
      xSpeed = random(5, 25);
      ySpeed = random(-10, 10);
    }
    score+=1;
  }
  if (screen == normalDiffScreen) {
    if (xSpeed >= 10) {
      xSpeed = 10;
    }
    if (ySpeed >= 10) {
      ySpeed = 10;
    }
  }
  if (screen == infernalDiffScreen) {
    if (xSpeed >= 25) {
      xSpeed = 25;
    }
    if (ySpeed >= 20) {
      ySpeed = 20;
    }
    if (screen == randomDiffScreen) {
      if (ySpeed <= 3 && ySpeed >= 0) {
        ySpeed = 3;
      }
      if (ySpeed >= -3 && ySpeed <= 0) {
        ySpeed = -3;
      }
    }
  }
}
void paddleBouncePong() {
  if (ballX - ballWidth/2 > paddleX && ballX - ballWidth/2 < paddleX + paddleWidth/2 && ballY - ballHeight/2 < paddleY + paddleHeight && ballY + ballHeight/2 > paddleY) {
    xSpeed = -xSpeed*105/100;
    ySpeed = ySpeed*104/100;
  }
  else if (ballX + ballWidth/2 > paddleX+550 && ballX + ballWidth/2 < paddleX+550 + paddleWidth/2 && ballY - ballHeight/2 < paddleY2 + paddleHeight && ballY + ballHeight/2 > paddleY2) {
    xSpeed = -xSpeed*105/100;
    ySpeed = ySpeed*104/100;
  }
  if (xSpeed >9){
    xSpeed = 9;
  }
}
void paddleBounceCoop() {
  if (ballX - ballWidth/2 > paddleX && ballX - ballWidth/2 < paddleX + paddleWidth/2 && ballY - ballHeight/2 < paddleY + paddleHeight && ballY + ballHeight/2 > paddleY || ballX - ballWidth/2 > paddleX+50 && ballX - ballWidth/2 < paddleX+50 + paddleWidth/2 && ballY - ballHeight/2 < paddleY2 + paddleHeight && ballY + ballHeight/2 > paddleY2 ) { 
    if (xSpeed < 0) {
      xSpeed = -xSpeed*106/100;
      ySpeed = ySpeed*105/100;
      score+=1;
    }
  }
  if (ballX2 - ballWidth/2 > paddleX && ballX2 - ballWidth/2 < paddleX + paddleWidth/2 && ballY2 - ballHeight/2 < paddleY + paddleHeight && ballY2 + ballHeight/2 > paddleY || ballX2 - ballWidth/2 > paddleX+50 && ballX2 - ballWidth/2 < paddleX+50 + paddleWidth/2 && ballY2 - ballHeight/2 < paddleY2 + paddleHeight && ballY2 + ballHeight/2 > paddleY2 ) { 
    if (xSpeed2 < 0) {
      xSpeed2 = -xSpeed2*112/100;
      ySpeed2 = ySpeed2*110/100;
      score +=1;
    }
  }
  if (xSpeed >= 10) {
    xSpeed = 10;
  }
  if (ySpeed >= 14) {
    ySpeed = 10;
  }
  if (xSpeed2 >= 12) {
    xSpeed2 = 12;
  }
  if (ySpeed2 >= 16) {
    ySpeed2 = 16;
  }
}
void paddleBounceRandomPong(){
   if (ballX - ballWidth/2 > paddleX && ballX - ballWidth/2 < paddleX + paddleWidth/2 && ballY - ballHeight/2 < paddleY + paddleHeight && ballY + ballHeight/2 > paddleY) {
    xSpeed = random(5, 15);
    ySpeed = random(-10, 10);
  }
  else if (ballX + ballWidth/2 > paddleX+550 && ballX + ballWidth/2 < paddleX+550 + paddleWidth/2 && ballY - ballHeight/2 < paddleY2 + paddleHeight && ballY + ballHeight/2 > paddleY2) {
    xSpeed = random(-5,-15);
    ySpeed = random(-10, 10);
  }
  if (ySpeed <= 3 && ySpeed >= 0) {
        ySpeed = 3;
      }
      if (ySpeed >= -3 && ySpeed <= 0) {
        ySpeed = -3;
      }
}

void ballReset() {
  if (ballX - ballWidth/2 < 0) {
    score3 +=1;
    setup();
  } else if (ballX + ballWidth/2 > width) {
    score2 +=1;
    setup();
  }
}
void gameOver() {
  if (ballX - ballWidth/2< 0|| ballX2 - ballWidth/2 <0 ) {
    xSpeed = 0;
    ySpeed = 0;
    xSpeed2 = 0;
    ySpeed2 = 0;
    if (score < 10) {
      text("you suck >:]", 100, 300);
    } else if (score < 20 && score >= 10) {
      text("git gud", 100, 300);
      textSize(7);
      text("hub", 228, 300);
    } else if (score < 50 && score >= 20) {
      text("not bad", 100, 300);
    } else if (score < 100 && score >= 50) {
      text("waow", 100, 300);
    } else if (score >= 100) {
      textSize(80);
      text("waow u so cool", 0, 300);
      textSize(7);
      text("like Mr Gallo", width/2-100, 325);
    }
    textSize(30);
    text("Title Screen", width/5, 500);
    text("Try Again?", width/4+width/3, 500);
    mouseLoc = dist(mouseX, mouseY, 217, 492);
    if (mousePressed) {
      if (mouseLoc <= 120) {
        screen = 0;
        setup();
      }
      mouseLoc = dist(mouseX, mouseY, 471, 492);
      if (mouseLoc <= 120) {
        if (screen == 1) {
          screen = normalDiffScreen;
          setup();
        }
        if (screen == 2) {
          screen = infernalDiffScreen;
          setup();
        }
        if (screen == 3) {
          screen = randomDiffScreen;
          setup();
        }
        if (screen == 5) { 
          screen = coopScreen;
          setup();
        }
        if (screen == 6) {
          screen = randomPongScreen;
          setup();
      }
    }
  }
}
}
void gameOverPong() {
  if (score == 5 || score2 == 5) {
    xSpeed = 0;
    ySpeed = 0;
    textSize(30);
    text("Title Screen", width/5, 500);
    text("Try Again?", width/4+width/3, 500);
    mouseLoc = dist(mouseX, mouseY, 217, 492);
    if (mousePressed) {
      if (mouseLoc <= 120) {
        screen = 0;
        score2 = 0;
        score3 = 0;
        setup();
      }
      mouseLoc = dist(mouseX, mouseY, 471, 492);
      if (mouseLoc <= 120) {
        score2 = 0;
        score3 = 0;
        setup();
      }
    }
  }
}
void scores() {
  textSize(100);
  fill(255);
  if (screen != pongScreen && screen != randomPongScreen) {
    text(score, width/2+150, 100);
  }
  if (screen == pongScreen|| screen == randomPongScreen) {
    text(score2, width/2-150, 100);
    text(score3, width/2+150, 100);
  }
}

void keyPressed() {
  if (key == 'w'|| key == 'W') {
    up = true;
  } 
  if (key == 's'|| key == 'S') {
    down = true;
  }
  if (keyCode == UP) {
    up2 = true;
  }
  if (keyCode == DOWN) {
    down2 = true;
  }
}
void keyReleased() {
  if (key == 'w'|| key == 'W') {
    up = false;
  } 
  if (key == 's'|| key == 'S') {
    down = false;
  }
  if (keyCode == UP) {
    up2 = false;
  }
  if (keyCode == DOWN) {
    down2 = false;
  }
}

void seizureBackground() {
  for (int i = 1; i<100; i++) {
    if (score == i*10) {
      background(random(0, 255), random(0, 255), random(0, 255));
    }
  }
}

void screen() {
  if (screen == 0) {
    background(0);

    fill(255);

    textSize(bigFont);
    text("Project S", width/2-100, 150);

    textSize(mediumFont);
    text("Singleplayer", width/2-250, 200);

    textSize(smallFont);
    text("Normal", width/2-230, 250);

    textSize(smallFont);
    text("Infernal+", width/2-230, 340);

    textSize(smallFont);
    text("Random", width/2-230, 430);

    textSize(mediumFont);
    text("Multiplayer", width/2+100, 200);

    textSize(smallFont);
    text("Pong", width/2+120, 250);

    textSize(smallFont);
    text("Co-op", width/2+120, 340);
    
    textSize(smallFont);
    text("Random Pong", width/2+120, 430);

    textSize(mediumFont);
    text("Credits: Derek Shat, Leo Xiao", width/2-200, 530);
  }
  fill(0, 0, 0, 0);
  noStroke(); //normal diff button
  rect(120, 228, 90, 30); 

  noStroke(); //inferno diff button
  rect(120, 288, 90, 30);

  noStroke(); //random diff button
  rect(120, 348, 90, 30);

  noStroke(); //pong button
  rect(501, 228, 90, 30);

  noStroke(); //co op music
  rect(501, 364, 90, 30);


  if (screen == normalDiffScreen) {
    normalMode();
  }
  if (screen == infernalDiffScreen) {
    infernalMode();
  }
  if (screen == randomDiffScreen) {
    randomMode();
  }
  if (screen == pongScreen) {
    pongMode();
  }
  if (screen == coopScreen) {
    coopMode();
  }
  if (screen == randomPongScreen){
    randomPongMode();
  }
}

void mousePressed() {
  mouseLoc = dist(mouseX, mouseY, 165, 246);
  if (mouseLoc <= 50 && screen == 0) {
    screen = normalDiffScreen;
  }

  mouseLoc = dist(mouseX, mouseY, 165, 332);
  if (mouseLoc <= 50 && screen == 0) {
    screen = infernalDiffScreen;
  }

  mouseLoc = dist(mouseX, mouseY, 165, 423);
  if (mouseLoc <= 50 && screen == 0) {
    screen = randomDiffScreen;
  }

  mouseLoc = dist(mouseX, mouseY, 501, 248);
  if (mouseLoc <= 50 && screen == 0) {
    screen = pongScreen;
  }
  mouseLoc = dist(mouseX,mouseY, 501,332);
    if (mouseLoc <= 50 && screen ==0){
      screen = coopScreen;
    }
  mouseLoc = dist(mouseX, mouseY, 501, 423);
  if (mouseLoc <= 50 && screen == 0) {
    screen = randomPongScreen;
  }
  println(mouseX, mouseY);
}
