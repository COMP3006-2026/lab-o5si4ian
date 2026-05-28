void setup() {
  size(800, 600, P3D);
}

void draw() {
  background(0);
  
  translate(width/2, height/2, 0);
  // Enable 3D rotation
  rotateX(map(mouseY, 0, height, -PI, PI));
  rotateY(map(mouseX, 0, width, -PI, PI));

  // Draw filled pentagon
  beginShape();
  fill(0, 255, 0);
  noStroke();
  
  float radius = 100;
  for (int i = 0; i < 5; i++) {
    float angle = TWO_PI / 5 * i - HALF_PI; // -HALF_PI to point one vertex up
    float x = cos(angle) * radius;
    float y = sin(angle) * radius;
    vertex(x, y);
  }
  
  endShape(CLOSE);
}
