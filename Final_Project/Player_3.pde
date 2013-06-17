class Player3 {
  float x;
  float y;
  float l;
  float w;
  float d;
  float r;
  float yspeed;
  float xspeed;
  float gravity;
  float bounceVel;
  float bounceVel2;

  Player3(float tx, float ty) {
    x=width/2;
    y=height/2;
    xspeed=5;
    w=100;
    l=125;
    yspeed=-1;
    gravity=.5;
    bounceVel=20;
    bounceVel2=30;
  }
  void display() {
    angel(x, y);
  }

  void angel(float x, float y) {
    noStroke();
    fill(15, 157, 235);
    rect(x, y, w, l);
    ellipse(x+50, y, 100, 100);
    fill(250);
    stroke(0);
    strokeWeight(1.5);
    ellipse(x+73, y-10, 35, 35);
    ellipse(x+35, y-10, 39, 42);
    strokeWeight(5);
    point(x+70,y-10);
    point(x+37,y-10);
    strokeWeight(1.5);
    noFill();
    arc(x+40,y,65,55,1.75,3.2);
    fill(255,250,15);
    ellipse(x+50,y-75,100,35);
    fill(0);
    ellipse(x+50,y-75,75,20);
    
  }

  void jump() {
    y=y+yspeed;
    yspeed=yspeed+gravity;
   


    if (keyPressed) {
      if (key==CODED) {
        if (keyCode==RIGHT) {
          x=x+xspeed;
        }
        if (keyCode==LEFT) {
          x=x-xspeed;
        }
      }
    }
    if (x<0) {
      x=width;
    }
    if (x>width) {
      x=0;
    }
  }


  boolean bounce(Platform3 p3) {
    if (x< p3.x + p3.w && x + w> p3.x && y+l/2+l/4  < p3.y + p3.l && y + l> p3.y && yspeed>0) {
        yspeed=-bounceVel;
        bounceCount3= bounceCount3+1;
        return true;
    }
    else{
      return false;
    }
  }

  boolean superBounce(superPlatform3 sP3) {
    if(x< sP3.x + sP3.w && x + w> sP3.x && y+l/2+l/4  < sP3.y + sP3.l && y + l> sP3.y && yspeed>0) {
        yspeed=-bounceVel2;
        bounceCount3= bounceCount3+5;
        return true;
      }
      else{
        return false;
    }
  }
    boolean gameover() {
      if (y>=height) {
        background(0);
        fill(255);
        textSize(50);
        text("GAME OVER", width/4, height/2);
        textSize(25);
        text("Press r to restart", width/2, height-200);
        heavenTheme.mute();
        fostersTheme.mute();
        return true;
      }
      else {
        heavenTheme.play();       
        return false;
      }
    }
  }

