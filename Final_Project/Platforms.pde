class Platform{
  float x;
  float y;
  float ySpeed;
  float l;
  float w;
  color c;
  
  
  Platform( color tc, color tw, color tq){
    x=random(width);
    y=random(50,100);
    ySpeed=1;
    l=30;
    w=100;
    c=color(0,250,100);
    c=tc;
    c=tq;
    c=tw;
  }
  void display(){
    fill(c);
    noStroke();
    rectMode(CENTER);
    rect(x,y,w,l);
  }
  void move(){
    y=y+ySpeed;
    
  }
  
    
}
