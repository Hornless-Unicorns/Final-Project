ArrayList p;
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
  //  frameRate(10);
  size(600, 800);
  graveyard=loadImage("Graveyard.jpg");
  farm= loadImage("Farm.jpg");
  gray=color(150);
  green=color(0, 200, 100);
  //  p[0]=new Platform(gray);
  p=new ArrayList();
  p.add(new Platform(gray, width/2,700));
  p.add(new Platform(gray, random(width), 600));
  p.add(new Platform(gray, random(width), 400));
  p.add(new Platform(gray, random(width), 300));

  g= new Player(width/2, height/2);
}
void draw() {
  image(graveyard, 0, 0);
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
  for (int i=0; i<p.size(); i++) {
    g.bounce((Platform)p.get(i));
    ((Platform)p.get(i)).display();
    
  }
  g.display();
  g.jump();
  g.gameover();
  adjust();
  remove();
  morePlatforms();
}

void adjust() {
  float heightLimit = height/2 - g.y;
  if (heightLimit>0) {
    g.y=g.y+heightLimit;
    for (int i=0; i<p.size(); i++) {
      ((Platform)p.get(i)).y += heightLimit;
    }
  }
  float heightMin = g.y-(height-g.l+200);
  if (heightMin >0) {
    g.y-= heightMin;
    for (int i=0; i<p.size(); i++) {
      ((Platform)p.get(i)).y -= heightMin;
    }
  }
}

void remove() {
  for (int i =p.size()-1; i>=0; i--) {
    if (((Platform)p.get(i)).y>height) {

      p.remove(i);
    }
  }
}

void morePlatforms() {
  if (p.size() < 4) {
    p.add(new Platform(gray, random(width), 300));
  }
}



