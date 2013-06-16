class Platform {
  float x;
  float y;
  float ySpeed;
  float l;
  float w;
  color c;


  Platform( color tc, float tx, float ty) {
    x=tx;
    y=ty;
    ySpeed=1;
    l=30;
    w=200;
    c=tc;
   
  }
  void display() {
    fill(c);
    noStroke();
    rect(x, y, w, l);
  }
  void move() {
    
    y=y+ySpeed;
  }
}

class superPlatform{
  float x;
  float y;
  float ySpeed;
  float l;
  float w;
  color c;
  
  superPlatform( color tc, float tx, float ty) {
    x=tx;
    y=ty;
    ySpeed=1;
    l=30;
    w=100;
    c=tc;
  }
  
  void display(){
    fill(c);
    noStroke();
    rect(x,y,w,l);
  }
}

