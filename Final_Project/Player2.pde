class Player2 {
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

  Player2(float tx, float ty) {
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
    bloo(x, y);
  }

  void bloo(float x, float y) {
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


  void bounce(Platform2 p2) {
    if (x< p2.x + p2.w && x + w> p2.x && y+l/2+l/4  < p2.y + p2.l && y + l> p2.y) {
      if (yspeed>0) {
        yspeed=-bounceVel;
        bounceCount2= bounceCount2+1;
      }
    }
  }

  void superBounce(superPlatform2 sP2) {
    if(x< sP2.x + sP2.w && x + w> sP2.x && y+l/2+l/4  < sP2.y + sP2.l && y + l> sP2.y) {
      if (yspeed>0) {
        yspeed=-bounceVel2;
        bounceCount2= bounceCount2+5;
      }
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
        return true;
      }
      else {
        return false;
      }
    }
  }

