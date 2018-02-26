

final color PAPER = color(0);

final int COUNT = 15;


void setup() {
  size(640, 480);
  noLoop();
}


void draw() {
  
  float size = max(width, height) / COUNT;
  
  colorMode(HSB, 1.0);
  color ink = color(random(1.0), random(1.0), 0.75);
  
  noStroke();
 
  rectMode(CORNER);
  ellipseMode(CENTER);
  
  float xCount = (width/COUNT)+1;
  float yCount = (height/COUNT)+1;
  
  for (int x=0; x<xCount; x++) {
    for (int y=0; y<yCount; y++) {
      
      fill((random(1.0)<0.5) ? PAPER : ink);
      rect(x*size, y*size, size, size);
      
      fill(((x+y)%2 == 0) ? PAPER : ink);
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