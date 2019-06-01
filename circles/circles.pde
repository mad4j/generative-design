
final color PAPER = 255;
final color INK = 0;


final int MAX_POINTS = 15;
final int MAX_LINES = 200;


PShape s = null;

PVector[] p = new PVector[MAX_POINTS];


void setup() {
  
  size(1200, 1200, P2D);
  smooth();
  
  float r = 0.3 * min(width, height);
  float w = 0.002 * min(width, height);

  s = createGlyph(MAX_POINTS, r, INK, w);
    
  background(PAPER);
}


void draw() {
  
  translate(0.5*width, 0.5*height);
  
  modifyGlyph(s);
  shape(s);

  if (frameCount > MAX_LINES) {
    save("circles.png");
    noLoop();
  }
}


PShape createGlyph(int points, float radius, color ink, float weight) {
  
  float a = TWO_PI / points;
  
  PShape s = createShape();
 
  s.beginShape();
  
    s.noFill();
    s.stroke(ink, 20);
    s.strokeWeight(weight);

    for (int i=0; i<points+3; i++) {
      s.curveVertex(radius*cos(a*i), radius*sin(a*i));
    }
  s.endShape();
  
  return s;
}


void modifyGlyph(PShape s) {
  
  PVector v = new PVector();
  PVector d = new PVector();
  
  int boundary = s.getVertexCount()-3;
  
  for (int i=0; i<boundary; i++) {
    
    v = s.getVertex(i);
 
    d.set(v)
     .normalize()
     .mult(random(-3.5, +3.5));
    
    s.setVertex(i, v.add(d));
  }
  
  for (int i=0; i<3; i++) {
    
    s.setVertex(boundary+i, s.getVertex(i));
  }
}
