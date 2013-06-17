//Bring Bloo back from the depths of the cartoon grave to cartoon heaven in this game where you bounce him higher.
//Use the arrow keys to guide bloo to the top of cartoon heaven.
//After 50 bounces on each level, you will proceed to the next one.
//There are three levels in total.

//Created the sound library
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

//There is a sound for level 1, 2,3, and the winner screen. 
Minim minim;
AudioPlayer ghostTheme;
AudioPlayer fostersTheme;
AudioPlayer heavenTheme;
AudioPlayer winner;
//There is an arraylist for each platform class. 
ArrayList p;
ArrayList sP;
ArrayList p2;
ArrayList sP2;
ArrayList p3;
ArrayList sP3;

//Called in the Images for the background.
PImage graveyard;
PImage fosters;
PImage heaven;

//The variables for the ghost, bloo, and angel.
Player g;
Player2 b;
Player3 a;

//Used various colors for the platforms
color gray;
color green;
color red;
color blue;
color yellow;
color purple;

//Booleans to for every game screen.
boolean gameStart=true;
boolean level2Start=true;
boolean level3Start=true;
boolean gameComplete=true;

//Counts the bounces for each level
int bounceCount;
int bounceCount2;
int bounceCount3;

//Level variable 
int LEVEL=1;



void setup() {

  size(600, 800);
  graveyard=loadImage("Graveyard.jpg");
  fosters= loadImage("Fosters.jpg");
  heaven=loadImage("Heaven.jpg");
  gray=color(150);
  green=color(0, 200, 100);
  red= color(200, 100, 50);
  blue= color(50, 100, 250);
  yellow= color(255, 250, 0);
  purple= color(140, 15, 230);

  minim = new Minim(this);

  ghostTheme= minim.loadFile("Ghost_Theme.mp3");
  fostersTheme = minim.loadFile("Fosters_Theme2.mp3");
  heavenTheme= minim.loadFile("Heaven_Theme.mp3");
  winner= minim.loadFile("Winner_Theme.mp3");

//Start level 1 with 10 platforms.
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

//Super Platform spawns off screen.
  sP=new ArrayList();
  sP.add(new superPlatform(green, random(width), -300));

//Created the ghost.
  g= new Player(width/2, height/2);
//Same for Level 2 
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
//And level 3
  p3= new ArrayList();
  p3.add(new Platform3(yellow, width/2, 700));
  p3.add(new Platform3(yellow, random(width), 550));
  p3.add(new Platform3(yellow, random(width), 340));
  p3.add(new Platform3(yellow, random(width), 190));
  p3.add(new Platform3(yellow, random(width), -80));

  sP3=new ArrayList();
  sP3.add(new superPlatform3(purple, random(width), -1000));

  a= new Player3(width/2, height/2);
}
void draw() {
  //When LEVEL= 1, the first screen appears.
  if (LEVEL==1) {
    if (gameStart==true) {

      background(0);
      textSize(50);
      text("Click to Start", 150, height/2);
    }
//When you click, the game starts.
    if (mousePressed) {
      ghostTheme.loop();
      gameStart=false;
    }
    if (gameStart==false) {

      game();
    }
  }
//When you reach 50 bounces on level 1, the level 2 starts. 
  if (bounceCount>=50) {
    LEVEL=2;
  }
  if (LEVEL==2) {
    if (level2Start==true) {
      ghostTheme.mute();
      fostersTheme.loop();
      background(0);
      fill(255);
      textSize(50);
      text("Level 2", width/2, height/2);
      textSize(25);
      text("Click to Start", width/2, 600);
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
  
//After 50 bounces on level 2, level 3 begins.
  if (bounceCount2>=50) {
    LEVEL=3;
  }
  if (LEVEL==3) {
    if (level3Start==true) {
      fostersTheme.mute();
      heavenTheme.loop();
      background(0);
      fill(255);
      textSize(50);
      text("Level 3", width/2, height/2);
      textSize(25);
      text("Click to Start", width/2, 600);
    }
    if (mousePressed) {
      level3Start=false;
    }
    if (level3Start==false) {
      image(heaven, -427, 0);
      level3();
      fill(255);
      text(bounceCount3, 525, 100);
      text("Bounces:", 300, 100);
    }
  }
//LEVEL 4 is the winner screen with music playing.
  if (bounceCount3>=50) {
    LEVEL=4;
  }
  if (LEVEL==4) {
    if (gameComplete==true) {
      heavenTheme.mute();
      winner.play();
      background(0);
      fill(random(255), random(255), random(255));
      textSize(50);
      text("YOU WIN!!!", width/2, height/2);
    }
  }
}


//Created the game function.  This is level 1 on the game.
void game() { 
  image(graveyard, 0, 0);
  textSize(37);
  fill(255);
  text(bounceCount, 525, 100);
  text("Bounces:", 300, 100); 
//Created a for loop to spawn the platforms
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
//Made a similar function for level 2. 
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
//And for level 3.
void level3() {
  for (int i=0; i<p3.size(); i++) {
    a.bounce((Platform3)p3.get(i));
    ((Platform3)p3.get(i)).display();
  }
  for (int j=0; j<sP3.size(); j++) {
    a.superBounce((superPlatform3)sP3.get(j));
    ((superPlatform3)sP3.get(j)).display();
  }
  a.display();
  a.jump();
  a.gameover();
  adjust3();
  remove3();
  morePlatforms3();
  restart();
}

//This adjust function makes the platforms scroll down whenever the character exceeds the height.
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
  for (int i=p.size()-1; i>=0; i--) {
    if (g.bounce((Platform)p.get(i))) {
      p.remove(i);
    }
  }

  for (int i =p.size()-1; i>=0; i--) {
    if (((Platform)p.get(i)).y>height) {

      p.remove(i);
    }
  }
  for (int j=sP.size()-1; j>=0; j--) {
    if (g.superBounce((superPlatform)sP.get(j))) {
      sP.remove(j);
    }
  }
  for (int j= sP.size()-1; j>=0; j--) {
    if (((superPlatform)sP.get(j)).y>height) {
      sP.remove(j);
    }
  }
}

void morePlatforms() {
  if (p.size() < 10) {
    p.add(new Platform(gray, random(width), -100));
  }
  if (sP.size()<1) {
    sP.add(new superPlatform(green, random(width), -1000));
  }
}

void restart() {
  if (g.y>=height || b.y>height || a.y>height) {
    if (keyPressed) {
      if (key=='r') {
        setup();
        bounceCount=0;
        bounceCount2=0;
        bounceCount3=0;
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
  for (int i=p2.size()-1; i>=0; i--) {
    if (b.bounce((Platform2)p2.get(i))) {
      p2.remove(i);
    }
  }
  for (int i =p2.size()-1; i>=0; i--) {
    if (((Platform2)p2.get(i)).y>height) {

      p2.remove(i);
    }
  }
  for (int j=sP2.size()-1; j>=0; j--) {
    if (b.superBounce((superPlatform2)sP2.get(j))) {
      sP2.remove(j);
    }
  }
  for (int j= sP2.size()-1; j>=0; j--) {
    if (((superPlatform2)sP2.get(j)).y>height) {
      sP2.remove(j);
    }
  }
}

void morePlatforms2() {
  if (p2.size() < 7) {
    p2.add(new Platform2(red, random(width), -150));
  }
  if (sP2.size()<1) {
    sP2.add(new superPlatform2(blue, random(width), -1500));
  }
}

void adjust3() {
  float heightLimit = height/2 - a.y;
  if (heightLimit>0) {
    a.y=a.y+heightLimit;
    for (int i=0; i<p3.size(); i++) {
      ((Platform3)p3.get(i)).y += heightLimit;
    }
    for (int j=0; j<sP3.size(); j++) {
      ((superPlatform3)sP3.get(j)).y += heightLimit;
    }
  }
  float heightMin = a.y-(height-a.l+200);
  if (heightMin >0) {
    a.y-= heightMin;
    for (int i=0; i<p3.size(); i++) {
      ((Platform3)p3.get(i)).y -= heightMin;
    }
    for (int j=0; j<sP3.size(); j++) {
      ((superPlatform3)sP3.get(j)).y -= heightMin;
    }
  }
}

void remove3() {
  for (int i=p3.size()-1; i>=0; i--) {
    if (a.bounce((Platform3)p3.get(i))) {
      p3.remove(i);
    }
  }

  for (int i =p3.size()-1; i>=0; i--) {
    if (((Platform3)p3.get(i)).y>height) {

      p3.remove(i);
    }
  }
  for (int j=sP3.size()-1; j>=0; j--) {
    if (a.superBounce((superPlatform3)sP3.get(j))) {
      sP3.remove(j);
    }
  }
  for (int j= sP3.size()-1; j>=0; j--) {
    if (((superPlatform3)sP3.get(j)).y>height) {
      sP3.remove(j);
    }
  }
}

void morePlatforms3() {
  if (p3.size() < 5) {
    p3.add(new Platform3(yellow, random(width), -200));
  }
  if (sP3.size()<1) {
    sP3.add(new superPlatform3(purple, random(width), -2000));
  }
}

