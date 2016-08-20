final int COUNT = 8;

size(512, 512);

float delta = max(width, height)/COUNT;

background(255);
fill(0);
noStroke();
  
for (int i=0; i<COUNT; i++) {
  for (int j=0; j<COUNT; j++) {
    if ((i+j)%2 == 0) {
      rect(i*delta, j*delta, delta, delta);
    }
  }
}
  
save("checkerboard.png");