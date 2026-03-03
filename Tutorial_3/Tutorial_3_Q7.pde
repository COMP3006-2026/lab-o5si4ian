/*void setup() {
  size(800, 400);
  background(255);
  
  // First pattern - using different noise seeds
  noiseSeed(100);
  drawNoisePattern(0, 0, 400, 400, 0.02);
  
  noiseSeed(200);
  drawNoisePattern(400, 0, 400, 400, 0.05);
  
  save("noise_patterns.png");
}

void drawNoisePattern(int offsetX, int offsetY, int w, int h, float scale) {
  for (int x = 0; x < w; x++) {
    for (int y = 0; y < h; y++) {
      float n = noise(x * scale, y * scale);
      
      // Different visualization for each pattern
      if (offsetX == 0) {
        // First pattern: grayscale circles
        fill(n * 255);
        noStroke();
        ellipse(offsetX + x, offsetY + y, 3, 3);
      } else {
        // Second pattern: colored waves
        stroke(n * 255, (1-n) * 255, n * 100);
        point(offsetX + x, offsetY + y);
      }
    }
  }
}
*/
