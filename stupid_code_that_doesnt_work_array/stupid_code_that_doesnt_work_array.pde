int y = 8*height/3;
int backgroundColour1 = #000000;
int backgroundColour2 = #FFFFFF;
float bgColourmodifier = 0;
int i;
int bG1 = 0;
int bG2 = 255;
int bG3 = 255;
int bG4 = 255;
int bG5 = 0;
int bG6 = 255;
int[] FBC, SBC;


void setup() {

  size(700, 580); 
  FBC = new int[1];
  FBC[1] = color(0 , 255, 255);


  SBC = new int[1];
  SBC[1] = color(255, 0, 255);

  
}

void draw() {
  background(#FFFFFF);
  i=0;
  while (i<width/2) {
    fill(lerpColor(FBC[1], SBC[1], bgColourmodifier));
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