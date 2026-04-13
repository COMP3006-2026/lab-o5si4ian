 void setup() {
  size(800, 600, P3D);
}

void draw() {
  background(0);
  
  // Enable 3D rotation to view the circle
  rotateX(map(mouseY, 0, height, -PI, PI));
  rotateY(map(mouseX, 0, width, -PI, PI));
  
  // Draw filled circle at mouse position
  pushMatrix();
  translate(mouseX, mouseY, 0);
  fill(255, 0, 0);
  noStroke();
  sphere(50); // Using sphere as a 3D circle
  popMatrix();
}
