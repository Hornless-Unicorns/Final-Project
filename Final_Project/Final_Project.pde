PImage graveyard;
PImage farm;
int count=0;
Platform[] p= new Platform[1000];

int currentTime;
int oldTime;
int timer=1000;
color red;
color green;
boolean gameStart=true;


void setup() {
  size(400, 800);
  graveyard=loadImage("Graveyard.jpg");
  farm= loadImage("Farm.jpg");
  red=color(255, 50, 10);
  green=color(0, 200, 100);
  p[0]=new Platform(red);
}
void draw() {

  if (gameStart==true) {
    background(0);
    text("Click to Start", 150, height/2);
    textSize(15);
  }

  if (gameStart==false) {
    game();
  }
  if (mousePressed) {
    gameStart=false;
  }
}


void game() {  
  
  currentTime=millis();
  if (currentTime<10000 && !gameStart) {
    image(graveyard, 0, 0);
    if (currentTime-oldTime>timer) {
      oldTime=currentTime;
      count++;
      p[count]= new Platform(red);
    }
  }
  if (currentTime>10000 && !gameStart) {
    image(farm, 0, 0);
    if (currentTime-oldTime>2000) {
      oldTime=currentTime;
      count++;
      p[count]= new Platform(green);
    }
  }
  for (int i=0; i<= count; i++) {
    p[i].display();
    p[i].move();
  }
}

//void mousePressed(){
//  
//  gameStart=!gameStart;
//  
//}

