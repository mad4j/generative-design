int timer;
int lastX;
int lastY;
int lastDripX;
int lastDripY;
int x;
int y;
float a;
 
void setup() {
  size(800,600);
  //frameRate(60);
  timer = 0;
  lastX = lastDripX = 800 / 2;
  lastY = lastDripY = 600 / 2;
  a = random(TWO_PI);
  fill(0);
  background(255);
  smooth();
  strokeJoin(ROUND);
}
 
void draw()
{
  fill(0);
  
  a += random(-0.1, 0.1);
  int l = (int) random(-10, 10);
  
  x = lastX + (int) (l * cos(a));
  y = lastY + (int) (l * sin(a));
  
  float d = dist(lastDripX, lastDripY, x, y);
  if (d > 200)
  {
    int numDrips = (int)random(3);
    randomCircles(x, y, numDrips, 2, 10, 10, 30);
    lastDripX = x;
    lastDripY = y;
  }
  int dx = abs(x - lastX);
  int dy = abs(y - lastY);
  if ((dx == 0) && (dy == 0))
  {
    strokeWeight(1);
  }
  else if (dist(x,y, lastX,lastY) < 2 )
  {
    strokeWeight(10);
  }
  else
  {
     strokeWeight(150/(dx+dy+15));
     timer = 0;
  }
  line(x,y, lastX,lastY);
  lastX = x;
  lastY = y;
   
  if (timer > 15)
  {
    clouds(15, 30, 10, 20);
    timer = (int)random(-50,15);
  }
  timer++;
}
 
void randomCircles(int x, int y, int numCircles, int minSize, int maxSize, int minDist, int maxDist)
{
  for(int i=0; i<numCircles; i++)
  {
    float r = minSize + random(maxSize-minSize);
    float offsetX = minDist + random(maxDist - minDist);
    float offsetY = minDist + random(maxDist - minDist);
    float flipX = random(1);
    if (flipX > 0.5) offsetX *= -1;
    float flipY = random(1);
    if (flipY > 0.5) offsetY *= -1;
    ellipse(x+offsetX, y+offsetY, r, r);
  }
}
 
void clouds(int minmin, int minmax, int maxmin, int maxmax)
{
   
  float minsize = random(minmin,minmax);
  float maxsize = minsize + random(maxmin,maxmax);
   
  for(int i=0; i<6; i++)
  {
    pushMatrix();
    translate(mouseX, mouseY);
    rotate(radians(random(360)));
    beginShape();
    vertex(0, 0);
    bezierVertex(0, 0+random(minsize,maxsize), 0+random(minsize,maxsize), 0, 0, 0);
    bezierVertex(0, 0-random(minsize,maxsize), 0-random(minsize,maxsize), 0, 0, 0);
    bezierVertex(0+random(minsize,maxsize), 0, 0, 0-random(minsize,maxsize), 0, 0);
    bezierVertex(0-random(minsize,maxsize), 0, 0, 0+random(minsize,maxsize), 0, 0);
    endShape();
    popMatrix();
  }
   
}
