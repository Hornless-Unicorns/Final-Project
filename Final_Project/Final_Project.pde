ArrayList p;
ArrayList sP;
PImage graveyard;
PImage farm;
int count=0;
//Platform[] p= new Platform[1000];
Player g;
int currentTime;
int oldTime;
int timer=7000;
color gray;
color green;
boolean gameStart=true;



void setup() {

  size(600, 800);
  graveyard=loadImage("Graveyard.jpg");
  farm= loadImage("Farm.jpg");
  gray=color(150);
  green=color(0, 200, 100);
  p=new ArrayList();
  p.add(new Platform(gray, width/2, 700));
  p.add(new Platform(gray, random(width), 600));
  p.add(new Platform(gray, random(width), 500));
  p.add(new Platform(gray, random(width), 400));
  p.add(new Platform(gray, random(width), 300));
  p.add(new Platform(gray, random(width), 200));
  p.add(new Platform(gray, random(width), 100));
  p.add(new Platform(gray, random(width), 0));
  p.add(new Platform(gray, random(width), -100));
  p.add(new Platform(gray, random(width), -200));

  sP=new ArrayList();
  sP.add(new superPlatform(green, random(width), -300));

  g= new Player(width/2, height/2);
}
void draw() {
  image(graveyard, 0, 0);
  if (gameStart==true) {
    background(0);
    textSize(50);
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
  for (int i=0; i<p.size(); i++) {
    g.bounce((Platform)p.get(i));
    ((Platform)p.get(i)).display();
  }
  for(int j=0; j<sP.size(); j++){
    g.superBounce((superPlatform)sP.get(j));
    ((superPlatform)sP.get(j)).display();
  }
  g.display();
  g.jump();
  g.gameover();
  adjust();
  remove();
  morePlatforms();
  restart();
}

void adjust() {
  float heightLimit = height/2 - g.y;
  if (heightLimit>0) {
    g.y=g.y+heightLimit;
    for (int i=0; i<p.size(); i++) {
      ((Platform)p.get(i)).y += heightLimit;
    }
    for (int j=0; j<sP.size(); j++) {
      ((superPlatform)sP.get(j)).y += heightLimit;
    }
  }
float heightMin = g.y-(height-g.l+200);
if (heightMin >0) {
  g.y-= heightMin;
  for (int i=0; i<p.size(); i++) {
    ((Platform)p.get(i)).y -= heightMin;
  }
  for (int j=0; j<sP.size(); j++) {
    ((superPlatform)sP.get(j)).y -= heightMin;
  }
}
}

void remove() {
  for (int i =p.size()-1; i>=0; i--) {
    if (((Platform)p.get(i)).y>height) {

      p.remove(i);
    }
  }
  for (int j= sP.size()-1; j>=0; j--) {
    if (((superPlatform)sP.get(j)).y>height+1000) {
      sP.remove(j);
    }
  }
}

void morePlatforms() {
  if (p.size() < 10) {
    p.add(new Platform(gray, random(width), 0));
  }
  if (sP.size()<1) {
    sP.add(new superPlatform(green, random(width), 0));
  }
}
void restart() {
  if (g.y>=height) {
    if (keyPressed) {
      if (key=='r') {
        setup();
      }
    }
  }
}

