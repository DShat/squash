PVector FirstBackgroundColour[];
PVector SecondBackgroundColour[];
int y = 8*height/3;
int backgroundColour1 = #000000;
int backgroundColour2 = #FFFFFF;
float bgColourmodifier;
int i;
int bG1 = 0;
int bG2 = 255;
int bG3 = 255;
int bG4 = 255;
int bG5 = 0;
int bG6 = 255;
void setup() {
  size(700, 580); 
  FirstBackgroundColour = new PVector[10];
  for (int i = 0; i < FirstBackgroundColour.length; i++) {
    FirstBackgroundColour[i] = new PVector(bG1, bG2, bG3);
    bG1+=10;
    bG2-=10;
    bG3-=10;
  }
  
  SecondBackgroundColour = new PVector[10];
  for (int i = 0; i < FirstBackgroundColour.length; i++) {
    SecondBackgroundColour[i] = new PVector(bG4, bG5, bG6);
    bG4-=10;
    bG5+=10;
    bG6-=10;
  }
}

void draw() {
  background(#FFFFFF);
  i=0;
  bgColourmodifier=0;
  while (i<width/2) {
    fill(lerpColor(FirstBackgroundColour[1], SecondBackgroundColour[1], bgColourmodifier));
    noStroke();
    rect(i, 0, i+2, height, 0.25);
    i+=1;
    bgColourmodifier+=0.003;
  }
  fill(#00FFFF);
  noStroke();
  rect(50, y, 10, 150); 

  i=width/2;
  bgColourmodifier=0;
  while (i<width) {
    fill(lerpColor(backgroundColour2, backgroundColour1, bgColourmodifier));
    noStroke();
    rect(i, 0, i+2, height, 0.25);
    i+=1;
    bgColourmodifier+=0.003;
  }


  if (keyPressed) {
    if (key =='s'||key =='S'|| key == UP) {
      y+=15;
    } else if (key == 'w'|| key == 'W'|| key == DOWN) {
      y-=15;
    }
  }
}