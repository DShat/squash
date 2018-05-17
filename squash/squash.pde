PVector FirstBackgroundColour[];
PVector SecondBackgroundColour[];
int y = height/2-height/8;
int backgroundColour1 = #000000;
int backgroundColour2 = #FFFFFF;
float bgColourmodifier;
int i;
void setup() {
  size(700, 580);
}

void draw() {
  background(#FFFFFF);
  i=0;
  bgColourmodifier=0;
  while (i<width/2) {
    fill(lerpColor(backgroundColour1, backgroundColour2, bgColourmodifier));
    noStroke();
    rect(i, 0, i+2, height, 0.25);
    i+=1;
    bgColourmodifier+=0.003;
    for (int bg1=0; bg1<10; bg1++) {
    }
  }

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
    } else {
      y+=0;
    }
    fill(#00FFFF);
    noStroke();
    rect(50, y, 10, 150);
  }
}