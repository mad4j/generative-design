
final color PAPER = color(255);
final color INK = color(0);


void setup() {
  size(1024, 1024);
  noLoop();
}


void draw() {

  translate(0.5*width, 0.5*height);

  background(PAPER);

  noFill();
  stroke(INK);
  strokeWeight(0.004*width);

  float cx = 0.1*width;
  float d = 0.02*width;
  
  int count = (int)round(10*d);

  for (int i=0; i<count; i++) {
    ellipse(-cx, 0, i*d, i*d);
    ellipse( cx, 0, i*d, i*d);
  }

  save("moire.png");
}
