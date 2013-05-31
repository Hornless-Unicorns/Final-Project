class Platform {
  float x;
  float y;
  float ySpeed;
  float l;
  float w;
  color c;


  Platform( color tc) {
    x=random(width);
    y=random(50, 100);
    ySpeed=1;
    l=30;
    w=100;
    c=tc;
   
  }
  void display() {
    fill(c);
    noStroke();
    rectMode(CENTER);
    rect(x, y, w, l);
  }
  void move() {
    y=y+ySpeed;
  }
}

