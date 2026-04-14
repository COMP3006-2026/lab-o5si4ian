void setup() {
  size(800, 600, P3D);
}

void draw() {
  background(0);
  
  // Translate to center of screen
  translate(width/2, height/2, 0);
  
  // Rotate the shape based on mouse position
  rotateX(map(mouseY, 0, height, -PI, PI));
  rotateY(map(mouseX, 0, width, -PI, PI));
  
  
  // Draw filled circle at center
  fill(255, 0, 0);
  noStroke();
  circle(0,0,100);
}
