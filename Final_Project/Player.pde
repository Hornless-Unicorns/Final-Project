class Player {
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

  Player(float tx, float ty) {
    x=width/2;
    y=height/2;
    xspeed=5;
    w=100;
    l=125;
    yspeed=-1;
    gravity=.5;
    bounceVel=15;
    bounceVel2=30;
  }
  void display() {
    ghost(x, y);
  }

  void ghost(float x, float y) {
    noStroke();
    fill(255);
    rect(x, y, w, l);
    ellipse(x+50, y, 100, 100);
    fill(0);
    ellipse(x+70, y-25, 25, 35);
    ellipse(x+35, y-25, 25, 35);
    ellipse(x+50, y, 25, 25);
  }

  void jump() {
    y=y+yspeed;
    yspeed=yspeed+gravity;
    //    if (y+l/2>height) {
    //      yspeed=-(yspeed)*.975;
    //    }


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


  boolean bounce(Platform p) {
    if (x< p.x + p.w && x + w> p.x && y+l/2+l/4  < p.y + p.l && y + l> p.y && yspeed>0) {
      
        yspeed=-bounceVel;
        bounceCount= bounceCount+1;

      
      return true;
    }
    else{
      return false;
    }
  }

  boolean  superBounce(superPlatform sP) {
    if(x< sP.x + sP.w && x + w> sP.x && y+l/2+l/4  < sP.y + sP.l && y + l> sP.y && yspeed>0) {
        yspeed=-bounceVel2;
        bounceCount= bounceCount+5;
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
        ghostTheme.mute();
        return true;
      }
      else {
        ghostTheme.play();
        return false;
      }
    }
  }

