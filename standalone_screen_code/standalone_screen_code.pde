int screen = 0;
int bigFont = 48;
int mediumFont = 28;
int smallFont= 20;

float mouseLoc;

int normalDiffScreen = 1;
int infernoDiffScreen = 2;
int randomDiffScreen = 3;
int pongScreen = 4;
int coopScreen = 5;

//Set up the window for the sketch
void setup() {
  size(700, 580);
}

void draw() {
  screen();
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
    text("Infernal+", width/2-230, 310);

    textSize(smallFont);
    text("Random", width/2-230, 370);

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
  rect(465, 228, 90, 30);

  noStroke(); //co op music
  rect(465, 348, 90, 30);


  if (screen == normalDiffScreen) {

  }
    if (screen == infernoDiffScreen) {

  }
    if (screen == randomDiffScreen) {
      
  }
    if (screen == pongScreen) {

  }
    if (screen == coopScreen) {
  }
  
}

void mousePressed() {
  mouseLoc = dist(mouseX, mouseY, 120, 228);
  if (mouseLoc <= 90) {
    screen = normalDiffScreen;
  }

  mouseLoc = dist(mouseX, mouseY, 120, 288);
  if (mouseLoc <= 90) {
    screen = infernoDiffScreen;
  }

  mouseLoc = dist(mouseX, mouseY, 120, 348);
  if (mouseLoc <= 90) {
    screen = randomDiffScreen;
  }

  mouseLoc = dist(mouseX, mouseY, 465, 228);
  if (mouseLoc <= 90) {
    screen = pongScreen;
  }

  mouseLoc = dist(mouseX, mouseY, 465, 348);
  if (mouseLoc <= 90) {
    screen = coopScreen;
  }
}