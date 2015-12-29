float num = 0;
 
void setup(){
  size(640, 640);
  noFill();
}
 
void draw(){
  background(255);
  translate(width/2, height/2);
  for(int i = 0; i < 360; i+=15){
    // The tan function allows the shapes to come back to the middle. (Look at tan graph)
    float a = tan(radians(i/2+num))*75;
    strokeWeight(abs(1+a/10));
    // If the values of tan are greater then 0, draw the shape.
    if(a > 0) ellipse(sin(radians(i*4))*a, cos(radians(i*4))*a, a, a);
  }
  num+=0.3;
}