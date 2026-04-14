import peasy.*;

PeasyCam cam;

void setup() {
  size(800, 600, P3D);
  cam = new PeasyCam(this, 400);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(1000);
}

void draw() {
  background(0);
  
  // Translate to center of screen (in world coordinates)
  translate(0, 0, 0);
  
  // Rotate the shape based on mouse position
  rotateX(map(mouseY, 0, height, -PI, PI));
  rotateY(map(mouseX, 0, width, -PI, PI));
  
  beginShape();
  fill(0, 255, 0);
  noStroke();
  
  float radius = 50;
  for (int i = 0; i < 5; i++) {
    float angle = TWO_PI / 5 * i - HALF_PI;
    float x = cos(angle) * radius;
    float y = sin(angle) * radius;
    vertex(x, y);
  }
  
  endShape(CLOSE);
}
