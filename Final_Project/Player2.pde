//PImage img;
//Player2 b; 
//void setup() {
//  b = new Player2(500,200);
//  size(800, 800);
//  background(0);
//  img = loadImage("boy for the game.png");
//}
//void draw(){
//  b.display();
//  b.man(100,100);
//  b.jump();
////  b.bounce();
//}
//class Player2 {
//  float x;
//  float y;
//  float l;
//  float w;
//  float d;
//  float r;
//  float yspeed;
//  float xspeed;
//  float gravity;
//  float bounceVel;
//
//  Player2(float tx, float ty) {
//    x=width/2;
//    y=height/2;
//    xspeed=5;
//    yspeed=-1;
//    gravity=.5;
//    bounceVel=20;
//  }
//  void display() {
//    man(x, y);
//  }
//  void man(float tx, float ty) {
//    image(img,0,0);
//  }
//  void jump() {
//    y=y+yspeed;
//    yspeed=yspeed+gravity;
//    if (y+l/2>height) {
//      yspeed=-(yspeed)*.975;
//    }
//
//
//    if (keyPressed) {
//      if (key==CODED) {
//        if (keyCode==RIGHT) {
//          x=x+xspeed;
//        }
//        if (keyCode==LEFT) {
//          x=x-xspeed;
//        }
//      }
//    }
//    if (x<0) {
//      x=width;
//    }
//    if (x>width) {
//      x=0;
//    }
//  }
////  boolean checkCollision (Platform p) {
////    if (x<p.x+w/2 && x+w>p.x-p.w/2 &&  y+l/2<p.y - p.l/2) {
////      print("touch");
////      return true;
////    }
////    else {
////      print("...");
////      return false;
////    }
////  }
//
////  void bounce(Platform p) {
////    if (x< p.x + p.w && x + w> p.x && y+l/2+l/4  < p.y + p.l && y + l> p.y) {
////      if (yspeed>0) {
////        yspeed=-bounceVel;
////      }
////    }
////  }
//}

