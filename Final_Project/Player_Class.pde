class Player {
  float x;
  float y;
  float d;
  float r;
  float yspeed;
  float xspeed;
  float gravity;

  Player(float tx, float ty) {
  x=width/2;
  y=height/2;
  }
  void display() {
   ghost(width/2,height/2);
   }
   
  void ghost(int x, int y){
  noStroke();
  fill(255);
  rect(x-50,y-35,100,125);
  ellipse(x,y-35,100,100);
  fill(0);
  ellipse(x+20,y-35,25,35);
  ellipse(x-20,y-35,25,35);
  ellipse(x,y,25,25);
  }
}

void bounce(){

}
