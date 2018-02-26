

final color PAPER = color(0);

final int COUNT = 15;


void setup() {
  size(512, 512);
  noLoop();
}


void draw() {
  
  //COUNT tiles on the longest side
  float size = max(width, height) / COUNT;
  
  //make sure that foreground is not BLACK
  colorMode(HSB, 1.0);
  color ink = color(random(1.0), random(1.0), 0.75);
  
  noStroke();
  
  //circles and rects will be shifted
  rectMode(CORNER);
  ellipseMode(CENTER);
  
  //compute how many tiles will be on each side
  float xCount = (width/COUNT)+1;
  float yCount = (height/COUNT)+1;
  
  //draw a random pattern
  for (int x=0; x<xCount; x++) {
    for (int y=0; y<yCount; y++) {
      
      //draw a rect with a random pattern
      fill((random(1.0)<0.5) ? PAPER : ink);
      rect(x*size, y*size, size, size);
      
      //draw an ellipse with checkerboard pattern
      fill(((x+y)%2 == 0) ? PAPER : ink);
      ellipse(x*size, y*size, size, size);
    }
  }
  
  save("truchet.png");
}


void mousePressed() {
  //draw a new pattern
  redraw();
}


void keyPressed() {
  //draw a new pattern
  redraw();
}