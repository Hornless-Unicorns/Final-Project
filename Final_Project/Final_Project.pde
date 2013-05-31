
int count=0;
Platform[] p= new Platform[1000];

int currentTime;
int oldTime;
int timer=1000;
void setup() {
  size(400, 800);
  p[0]=new Platform(100,200,0);
}
void draw() {
  background(0, 100, 200);
  currentTime=millis();
  if (currentTime<10000) {
    if (currentTime-oldTime>timer) {
      oldTime=currentTime;
      count++;
      p[count]= new Platform(100,200,0);
    }
  }
  if (currentTime>10000) {
    background(0, 50, 250);
    if (currentTime-oldTime>3000) {
      oldTime=currentTime;
      count++;
      p[count]= new Platform(200,100,0);
    }
  }
  for (int i=0; i<= count; i++) {
    p[i].display();
    p[i].move();
  }
}

