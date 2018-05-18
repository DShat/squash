int y = 8*height/3;
int backgroundColour1 = #000000;
int backgroundColour2 = #FFFFFF;
float bgColourmodifier;
int bG1[];
int bG2[];
int bG3[];
int bG4[];
int bG5[];
int bG6[];
int i;
void setup() { 
  size(700, 580);
  bG1 = new int[10];
  for(int q=0; q<bG1.length; q+=1){
    bG1[q] = (q*10);
  }
   bG2 = new int[10];
  for(int q=0; q<bG2.length; q+=1){
    bG2[q] = (255-q*10);
  }
   bG3 = new int[10];
  for(int q=0; q<bG3.length; q+=1){
    bG3[q] = (255-q*10);
  }
   bG4 = new int[10];
  for(int q=0; q<bG4.length; q+=1){
    bG4[q] = (255-q*10);
  }
   bG5 = new int[10];
  for(int q=0; q<bG5.length; q+=1){
    bG5[q] = (q*10);
    }
   bG6 = new int[10];
  for(int q=0; q<bG6.length; q+=1){
    bG6[q] = (255-q*10);
  }
  }
}
void draw() {
  background(#FFFFFF);
  i=0;
  bgColourmodifier=0;
  while (i<width/2) {
    fill(lerpColor(bG1[9], backgroundColour2, bgColourmodifier));
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
