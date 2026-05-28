/*void setup() {
  size(400, 400);
  background(255);
}

void draw() {
  translate(200, 200);
  stroke(0);
  
  // Draw axes
  line(-200, 0, 200, 0);  // x-axis
  line(0, -200, 0, 200);  // y-axis
  
  // Draw the curve
  beginShape();
  for (float x = -1.5; x <= 1.5; x += 0.01) {
    float y = 1 - pow(x, 4);
    float screenX = x * 100;
    float screenY = -y * 150;  // Negative because y increases downward
    vertex(screenX, screenY);
  }
  endShape();
  
  noLoop();
}
*/
