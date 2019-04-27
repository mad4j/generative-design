
// Squares
// daniele.olmisani@gmail.com

// see LINCENSE file


final color PAPER = color(0);
final color INK = color(255);


void setup() { 
  size(1024, 1024);
  noLoop();
}


void draw() {
  
  translate(0.5*width, 0.5*height);
  
  background(PAPER);
  
  noStroke();
  rectMode(CENTER);
  
  float l = min(width, height);
  
  for (int i=0; i<40; i++) {
    
    scale(0.9);
    rotate(-0.025*PI);
    
    fill( (i%2==0) ? INK : PAPER); 
    rect(0, 0, l, l);   
  }
  
  save("squares.png"); 
}
