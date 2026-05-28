import peasy.*;

PeasyCam cam;
float angle = 0;

void setup() {
  size(800, 600, P3D);
  cam = new PeasyCam(this, 400);
}

void draw() {
  background(0);
  lights();
  
  // Draw Earth (blue sphere)
  pushMatrix();
  fill(0, 0, 255);
  noStroke();
  sphere(50);
  popMatrix();
  
  // Update moon's orbit angle
  angle += 0.02;
  
  // Draw Moon (grey sphere) orbiting around Earth
  pushMatrix();
  rotateY(angle);
  translate(150, 0, 0);
  fill(128);
  noStroke();
  sphere(20);
  popMatrix();
}
