import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer fostersTheme;
AudioPlayer ghostTheme;
ArrayList p;
ArrayList sP;
ArrayList p2;
ArrayList sP2;
PImage graveyard;
PImage fosters;
int count=0;
Player g;
Player2 b;
int currentTime;
int oldTime;
int timer=7000;
color gray;
color green;
color red;
color blue;
boolean gameStart=true;
boolean level2Start=true;
int bounceCount;
int bounceCount2;
int LEVEL=1;



void setup() {

  size(600, 800);
  graveyard=loadImage("Graveyard.jpg");
  fosters= loadImage("Fosters.jpg");
  gray=color(150);
  green=color(0, 200, 100);
  red= color(200, 100, 50);
  blue= color(50, 100, 250);
  
  minim = new Minim(this);
  fostersTheme = minim.loadFile("Fosters_Theme2.mp3");
  ghostTheme= minim.loadFile("Ghost_Theme.mp3");
  
  
  p=new ArrayList();
  p.add(new Platform(gray, width/2, 700));
  p.add(new Platform(gray, random(width), 600));
  p.add(new Platform(gray, random(width), 450));
  p.add(new Platform(gray, random(width), 350));
  p.add(new Platform(gray, random(width), 250));
  p.add(new Platform(gray, random(width), 150));
  p.add(new Platform(gray, random(width), 50));
  p.add(new Platform(gray, random(width), 0));
  p.add(new Platform(gray, random(width), -200));
  p.add(new Platform(gray, random(width), -350));

  sP=new ArrayList();
  sP.add(new superPlatform(green, random(width), -300));

  g= new Player(width/2, height/2);

  p2= new ArrayList();
  p2.add(new Platform2(red, width/2, 700));
  p2.add(new Platform2(red, random(width), 600));
  p2.add(new Platform2(red, random(width), 400));
  p2.add(new Platform2(red, random(width), 200));
  p2.add(new Platform2(red, random(width), 0));
  p2.add(new Platform2(red, random(width), -250));
  p2.add(new Platform2(red, random(width), -500));
  p2.add(new Platform2(red, random(width), -700));
  p2.add(new Platform2(red, random(width), -900));

  sP2= new ArrayList();
  sP2. add(new superPlatform2(blue, random(width), -488));

  b= new Player2( width/2, height/2);
}
void draw() {
  if (LEVEL==1) {
    if (gameStart==true) {
      
      background(0);
      textSize(50);
      text("Click to Start", 150, height/2);
    }
    if (mousePressed) {
      ghostTheme.loop();
      gameStart=false;
    }
    if (gameStart==false) {
      
      game();
    }
  }

  if (bounceCount>=100) {
    LEVEL=2;
  }
  if (LEVEL==2) {
    if (level2Start==true) {
      ghostTheme.mute();
      fostersTheme.loop();
      background(0);
      fill(255);
      textSize(50);
      text("Level 2", 150, height/2);
      textSize(25);
      text("Click to Start", 150, 600);
    }
    if (mousePressed) {
      level2Start=false;
    }
    if (level2Start==false) {
        
      image(fosters, -200, -350);
      level2();
      fill(255);
      text(bounceCount2, 525, 100);
      text("Bounces:", 300, 100);
    }
  }
}



void game() { 
  image(graveyard, 0, 0);
  textSize(37);
  fill(255);
  text(bounceCount, 525, 100);
  text("Bounces:", 300, 100); 
  for (int i=0; i<p.size(); i++) {
    g.bounce((Platform)p.get(i));
    ((Platform)p.get(i)).display();
  }
  for (int j=0; j<sP.size(); j++) {
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

void level2() {

  for (int i=0; i<p2.size(); i++) {
    b.bounce((Platform2)p2.get(i));
    ((Platform2)p2.get(i)).display();
  }
  for (int j=0; j<sP2.size(); j++) {
    b.superBounce((superPlatform2)sP2.get(j));
    ((superPlatform2)sP2.get(j)).display();
  }
  b.display();
  b.jump();
  b.gameover();
  adjust2();
  remove2();
  morePlatforms2();
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
  if (g.y>=height || b.y>height) {
    if (keyPressed) {
      if (key=='r') {
        setup();
        bounceCount=0;
        bounceCount2=0;
      }
    }
  }
}

void adjust2() {
  float heightLimit = height/2 - b.y;
  if (heightLimit>0) {
    b.y=b.y+heightLimit;
    for (int i=0; i<p2.size(); i++) {
      ((Platform2)p2.get(i)).y += heightLimit;
    }
    for (int j=0; j<sP2.size(); j++) {
      ((superPlatform2)sP2.get(j)).y += heightLimit;
    }
  }
  float heightMin = b.y-(height-b.l+200);
  if (heightMin >0) {
    b.y-= heightMin;
    for (int i=0; i<p2.size(); i++) {
      ((Platform2)p2.get(i)).y -= heightMin;
    }
    for (int j=0; j<sP2.size(); j++) {
      ((superPlatform2)sP2.get(j)).y -= heightMin;
    }
  }
}

void remove2() {
  for (int i =p2.size()-1; i>=0; i--) {
    if (((Platform2)p2.get(i)).y>height) {

      p2.remove(i);
    }
  }
  for (int j= sP2.size()-1; j>=0; j--) {
    if (((superPlatform2)sP2.get(j)).y>height+1488) {
      sP2.remove(j);
    }
  }
}

void morePlatforms2() {
  if (p2.size() < 7) {
    p2.add(new Platform2(red, random(width), 0));
  }
  if (sP2.size()<1) {
    sP2.add(new superPlatform2(blue, random(width), 0));
  }
}

