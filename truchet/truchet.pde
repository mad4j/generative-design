

final color PAPER = color(0);
final color INK = color(255);


final int COUNT = 15;

void setup() {
  size(480, 640);
  noLoop();
}


void draw() {
  
  float size = max(width, height) / COUNT;
 
  rectMode(CORNER);
  ellipseMode(CENTER);
  
  noStroke();
  
  float xCount = (width/COUNT)+1;
  float yCount = (height/COUNT)+1;
  
  for (int x=0; x<xCount; x++) {
    for (int y=0; y<yCount; y++) {
      
      fill((random(1.0)<0.5) ? PAPER : INK);
      rect(x*size, y*size, size, size);
      
      fill(((x+y)%2 == 0) ? PAPER : INK);
      ellipse(x*size, y*size, size, size);
    }
  }
}

void mousePressed() {
  redraw();
}

void keyPressed() {
  redraw();
}