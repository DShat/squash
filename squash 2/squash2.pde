int paddleX, paddleY, paddleY2, paddleWidth, paddleHeight, paddleSpeed; //paddle values such as x and y location, width and height, and speed

float ballX, ballY, ballX2, ballY2, ballHeight, ballWidth; //ball values like x and y location, width and height

double xSpeed, xSpeed2, ySpeed, ySpeed2; //the universal x and y speed of the ball

double xSpeedN, ySpeedN, xSpeedI, ySpeedI; //the x and y speed of the ball when normal or inferno is pressed (ball speed increases differently)

boolean up, up2, down, down2; //allows user to control paddle when they press w

int score; //remembers the number of times the ball hit the paddle

int screen = 0; //title screen value
int bigFont = 48; //font size of the big fonts
int mediumFont = 28; //font size of the medium fonts
int smallFont = 20; //font size of the small fonts

float mouseLoc; //for clicking the options on the screen

int normalDiffScreen = 1; //normal screen value
int infernalDiffScreen = 2; //infernal diff screen
int randomDiffScreen = 3; //random diff screen
int pongScreen = 4; //pong mode
int coopScreen = 5; //co-op mode 

PImage img; //function for loading the image for random mode

void setup() { 
  size(700, 580); //size of canvas
  img = loadImage("awesomeface.png"); //loads image for the game

  paddleX = 75; //x location of paddle
  paddleY = height/2; //y location of paddle
  paddleY2 = height/2; //y location of the second paddle (co-op mode only)
  paddleWidth = 20; //width of paddle
  paddleHeight = 150; //height of paddle
  paddleSpeed = 10; //speed of paddle

  ballX = width/2; //x location of ball
  ballX2 = 3*width/4; //x location of the second ball (co-op mode only)
  ballY = height/2; //y location of ball
  ballY2 = height/4; //y location of second ball (co-op mode only)
  ballWidth = 50; //width of ball
  ballHeight = 50; //height of ball

  xSpeed = 5; //x speed of ball
  xSpeed2 = 3; //x speed of second ball (co-op mode only)
  ySpeed = 4; //y speed of ball
  ySpeed2 = 4; //y speed of second ball (co-op mode only)
  xSpeedN = 105/100; //how much the xspeed increases when paddle hits ball in normal mode
  ySpeedN = 104/100; //how much the yspeed increases when paddle hits ball in normal mode

  score = 0; //sets the score value to 0
}

void draw() {
  screen(); //draws the title screen
}

//all the functions normal mode needs to call
void normalMode() {
  background(#00A71D); //background will
  theWall();
  drawPaddle();
  movePaddle();
  restrictPaddle();
  drawBall();
  moveBall();
  ballBounce();
  paddleBounceNormal();
  gameOver();
  scores();
}

//all the functions inferno mode needs to call (it's similar to normal mode)
void infernalMode() {
  background(#A7009D);
  theWall();
  paddleHeight = 200;
  drawPaddle();
  movePaddle();
  restrictPaddle();
  drawBall();
  moveBall();
  ballBounce();
  paddleBounceInfernal();
  gameOver();
  scores();
}

//all the functions random mode needs to call
void randomMode() {
  background(#FF95D0);
  seizureBackground();
  theWall();
  awesomeFace();
  drawPaddle();
  movePaddle();
  restrictPaddle();
  drawBall();
  moveBall();
  ballBounceRandom();
  paddleBounceRandom();
  gameOver();
  scores();
}

//all the functions co-op mode needs to call
void coopMode() {
  background(#00A71D);
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

//draws the paddle and colors it cyan
void drawPaddle() {
  fill(#00FFFF);
  noStroke();
  rect(paddleX, paddleY, paddleWidth, paddleHeight);
  //also draws the second paddle if the game is in the co-op screen
  if (screen == coopScreen) {
    rect(paddleX+50, paddleY2, paddleWidth, paddleHeight);
  }
}

//allows user to control the paddle up and down
void movePaddle() {
  if (up) {
    paddleY-=paddleSpeed;
  } else if (down) {
    paddleY+=paddleSpeed;
  }
  //if the game is in co-op screen then allows player 2 to control the second paddle
  if (screen == coopScreen) {
    if (up2) {
      paddleY2 -= paddleSpeed;
    } else if (down2) {
      paddleY2 += paddleSpeed;
    }
  }
}

//stops the paddle from going off screen
void restrictPaddle() {
  if (paddleY < 0) {
    paddleY += paddleSpeed;
  }
  if (paddleY + paddleHeight > height) {
    paddleY -= paddleSpeed;
  }
  if (screen == coopScreen) {
    if (paddleY2 < 0) {
      paddleY2 += paddleSpeed;
    }
    if (paddleY2 + paddleHeight > height) {
      paddleY2 -= paddleSpeed;
    }
  }
}

//draws the ball and colors it white also draws the second ball if the game is in co-op mode
void drawBall() {
  fill(#ffffff);
  ellipse(ballX, ballY, ballWidth, ballHeight);
  if (screen == coopScreen) {
    ellipse(ballX2, ballY2, ballWidth, ballHeight);
  }
}

//moves the ball by constantly updating its x and y locations
void moveBall() {
  ballX += xSpeed;
  ballY += ySpeed;
  if (screen == coopScreen) {
    ballX2 += xSpeed2;
    ballY2 += ySpeed2;
  }
}

//draws the wall and colors it red
void theWall() {
  noStroke();
  fill(#FF0000);
  rect(width-100, 0, width, height);
}

//allows the ball to bounce off the walls 
void ballBounce() {
  if (ballX > width-100 - ballWidth/2) { //when the right side of the ball hits the wall on the left, the ball will bounce off
    xSpeed = -xSpeed;
  }
  if (ballY >= height - ballHeight/2) { //when ball hits the bottom of the screen, the ball bounces up
    ySpeed = -ySpeed;
  } else if (ballY - ballHeight/2 < 0) { //when ball hits the top of the screen the ball bounces down
    ySpeed = -ySpeed;
  }
  //basically the same thing as above but in co-op mode for the second ball
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

//for random mode only!
void ballBounceRandom() {
  if (ballX > width-100 - ballWidth/2) { //when wall bounces off the wall on the right, the xspeed of ball changes depending on the number chosen randomly from 3 to 13
    xSpeed = -random(3, 13);
    ySpeed = random(-10, 10); //also changes the yspeed depending on random number picked from -10 to 10
    if (xSpeed >= 16) {
      xSpeed = random(-16, 16); //limits the speed if it ever becomes greater than 16 back to 16
      if (xSpeed <= 5 && xSpeed >= 0) {
        xSpeed = 5; //sets minimum xspeed of ball to be 5
      }
    }
    if (ySpeed >= 10) {
      ySpeed = random(-10, 10); //when ball bounces off the wall on the left, the yspeed of ball changes depending on the number chosen randomly from -10 to 10
      if (ySpeed <=2 && ySpeed >= 0) {
        ySpeed = 3; //makes the minimum positive yspeed of the ball 3
      }
      if (ySpeed >= -2 && ySpeed <= 0) {
        ySpeed = -3; //makes the minimum negative yspeed of the ball -3
      }
    }
  }
  if (ballY >= height - ballHeight/2) { //this code makes the ball change its speed to a random value when it hits the bottom of the screen, same change as when it hits the right
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

void paddleBounceNormal() { //when the left of the ball hits the 
  //left of the ball is greater than middle of the paddle and left of ball is less than the right of paddle
  //                                                                             bally has to be less than the top of the paddle and greater than the bottom of the paddle
  if (ballX - ballWidth/2 > paddleX && ballX - ballWidth/2 < paddleX + paddleWidth/2 && ballY - ballHeight/2 < paddleY + paddleHeight && ballY + ballHeight/2 > paddleY) { 
    if (xSpeed < 0) {
      xSpeed = -xSpeed*105/100; //when conditions are met makes ball go right and a little bit faster
      ySpeed = ySpeed*104/100;
      score+=1; //increases the score everytime paddle hits ball
    }
    if (xSpeed >= 10) {
      xSpeed = 10; //limits the xspeed to be 10 so it doesn't keep going faster infinitely
    }
    if (ySpeed >= 10) {
      ySpeed = 10; //limits the yspeed so it doesnt keep going faster infinitely
    }
  }
}

//mostly the same as the normal mode code
void paddleBounceInfernal() { 
  if (ballX - ballWidth/2 > paddleX && ballX - ballWidth/2 < paddleX + paddleWidth/2 && ballY - ballHeight/2 < paddleY + paddleHeight && ballY + ballHeight/2 > paddleY) { 
    if (xSpeed < 0) {
      xSpeed = -xSpeed*108/100; //made the multiplier a bit higher
      ySpeed = ySpeed*107/100;
      score+=1;
    }
    if (xSpeed >= 25) {
      xSpeed = 25; //made the speed limit higher as well
    }
    if (ySpeed >= 20) {
      ySpeed = 20;
    }
  }
}

//when ball hits paddle in random mode, the ball speed also changes randomly
void paddleBounceRandom() {
  if (ballX - ballWidth/2 < paddleX + paddleWidth/2 && ballY - ballHeight/2 < paddleY + paddleHeight && ballY + ballHeight/2 > paddleY) { 
    if (xSpeed < 0) {
      xSpeed = random(5, 25);
      ySpeed = random(-10, 10);
      score+=1;
    }
    if (ySpeed <= 3 && ySpeed >= 0) {
      ySpeed = 3;
    }
    if (ySpeed >= -3 && ySpeed <= 0) {
      ySpeed = -3;
    }
  }
}

//allows both balls to interact with both paddles
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
      xSpeed2 = -xSpeed2*108/100;
      ySpeed2 = ySpeed2*109/100;
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

void gameOver() {
  if (ballX - ballWidth/2 < 0) { //when the ball hits the left of the screen
  
    xSpeed = 0; //balls stop moving
    ySpeed = 0;
    xSpeed2 =0;
    ySpeed2 =0;
    
    //displays text based on the score
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
    
    //also gives user two options to go back to the main menu (screen 1) or to play the same mode again
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
        if (screen == 4) {
          screen = pongScreen;
          setup();
        }
        if (screen == 5) { 
          screen = coopScreen;
          setup();
        }
      }
    }
  }
}

//displays the score in the center of screen near the top
void scores() {
  textSize(100);
  fill(255);
  text(score, width/2, 100);
}

void awesomeFace() {
  image(img, 600, 230, 100, 100);
}

//if user pressed w/up or s/down then the paddle will move until they release the key
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

//when score is a multiple of 10 the background starts spazzing out, only in random mode, idk why this exists .-.
void seizureBackground() {
  for (int i = 1; i<100; i++) {
    if (score == i*10) {
      background(random(0, 255), random(0, 255), random(0, 255));
    }
  }
}

//the main menu code! Which is just a bunch of text and buttons
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
    text("Co-op", width/2+120, 370);

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

  noStroke(); //co op button
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
  if (screen == coopScreen) {
    coopMode();
  }
}

//uses the distance of the mouse and the invisible square to see what the user has clicked to go to the appropriate screen
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

  mouseLoc = dist(mouseX, mouseY, 501, 288);
  if (mouseLoc <= 50 && screen == 0) {
    screen = pongScreen;
  }

  mouseLoc = dist(mouseX, mouseY, 501, 364);
  if (mouseLoc <= 50 && screen == 0) {
    screen = coopScreen;
  }
  println(mouseX, mouseY); //for developers only ;)
}
