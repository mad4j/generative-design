
void setup() {
  size(512, 512);
}
 
void draw() {
  
  translate(width/2.0, height/2.0);
  
  background(245);
  noFill();
  stroke(#05225C);
  
  for(int r=10; r<280; r=r+20) {
    rotate(millis()/1000.0);
    strokeWeight(r/30);
    arc(0, 0, r, r, 0, PI);
  }
}