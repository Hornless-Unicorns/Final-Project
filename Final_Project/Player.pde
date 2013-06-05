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

  Player(float tx, float ty) {
    x=width/2;
    y=height/2;
    w=100;
    l=125;
    yspeed=-1;
    gravity=.5;
  }
  void display() {
    ghost(x, y);
  }

  void ghost(float x, float y) {
    noStroke();
    fill(255);
    rect(x, y+35, w, l);
    ellipse(x, y-35, 100, 100);
    fill(0);
    ellipse(x+20, y-35, 25, 35);
    ellipse(x-20, y-35, 25, 35);
    ellipse(x, y, 25, 25);
  }

  void jump() {
    y=y+yspeed;
    yspeed=yspeed+gravity;
    if (y+l*.75>height) {
      yspeed=-(yspeed)*.975;
    }
  }
  
  boolean checkCollision (Platform p) {
    if (x<p.x+w && x+w>p.x && y+1 > p.y && y+l<p.y+l) {
      print("touch");
      return true;
    }
    else {
      print("...");
      return false;
    }
  }
  
  void bounce(Platform p){
    if(checkCollision(p)){
      if(y+l> p.y-p.l/2){
       yspeed=-(yspeed)*.975;
      }
    }
  }
}

