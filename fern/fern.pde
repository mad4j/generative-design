
void setup() {
  size(512, 512);
  noLoop();
}

void draw() {
  background(255);
  makeLeaf(0.05 * width, 0.72 * height, -PI * 0.2, 0.2 * width, 7, 1, 14);
}

void makeLeaf(float x, float y, float angle, float length, float depth, float direction, float thickness) {
  
  float x1 = x;
  float y1 = y;
  float newAngle = angle;
  float newLength = length;
  
  if (depth > 0) {
    for (int i = 0; i < 35; i++) {
      newAngle = newAngle + direction * 0.04 * PI;
      newLength = 0.84 * newLength;
      float x2 = x1 + cos(newAngle) * newLength;
      float y2 = y1 + sin(newAngle) * newLength;
      if (newLength > 2) {
        makeLeaf(0.3 * x1 + 0.7 * x2, 0.3 * y1 + 0.7 * y2, newAngle + PI * 0.5, 0.4 * newLength, depth - 1, -1, thickness - i - 3);
        makeLeaf(x2, y2, newAngle - PI * 0.4, 0.4 * newLength, depth - 1, 1, thickness - i - 3);
      }
      stroke(243 - depth * 180 / 8, 246 - depth * 146 / 8, 240 - depth * 216 / 8);
      //stroke(141, 182, 0);
      strokeWeight(max(1, thickness - i));
      line(x1, y1, x2, y2);
      x1 = x2;
      y1 = y2;
    }
  }
}
