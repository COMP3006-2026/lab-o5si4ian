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
  
  // Draw pentagon at mouse position
  pushMatrix();
  translate(mouseX - width/2, mouseY - height/2, 0);
  
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
  popMatrix();
}
