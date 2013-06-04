class Player {
  float x;
  float y;
  float d;
  float r;
  float yspeed;
  float xspeed;
  float gravity;

  Player(float tx, float ty) {
  }
  void display() {
   noStroke();
  fill(255);
  rect(450,500,100,125);
  ellipse(500,500,100,100);
  fill(0);
  ellipse(520,500,25,35);
  ellipse(480,500,25,35);
  ellipse(500,535,25,25);
  }
}
