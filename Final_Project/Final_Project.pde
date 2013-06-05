PImage graveyard;
PImage farm;
int count=0;
Platform[] p= new Platform[1000];
Player g;
int currentTime;
int oldTime;
int timer=1000;
color gray;
color green;
boolean gameStart=true;


void setup() {
//  frameRate(10);
  size(400, 800);
  graveyard=loadImage("Graveyard.jpg");
  farm= loadImage("Farm.jpg");
  gray=color(150);
  green=color(0, 200, 100);
  p[0]=new Platform(gray);
  g= new Player(width/2, height/2);
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
  if (currentTime<10000 && gameStart==false ) {
    image(graveyard, 0, 0);
    if (currentTime-oldTime>timer) {
      oldTime=currentTime;
      count++;
      p[count]= new Platform(gray);
    }
  }
  if (currentTime>10000 && gameStart==false ) {
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
    g.bounce(p[i]);
  }
  g.display();
  g.jump();
  
}
void keyPressed(){
 if(key==CODED){
  if(keyCode==RIGHT){
   x=x+xspeed; 
  }
  if(keyCode==LEFT){
   x=x-xspeed; 
  }
 } 
}

//void mousePressed(){
//  
//  gameStart=!gameStart;
//  
//}

