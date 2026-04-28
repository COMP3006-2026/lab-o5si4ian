// Task 1: Sphere moving with mouse, Shift for Z movement
float sphereX, sphereY, sphereZ;

void setup() {
  size(800, 600, P3D);
  sphereX = width/2;
  sphereY = height/2;
  sphereZ = 0;
}
void draw() {
  background(0);
  lights();
  
  if (keyPressed && keyCode == SHIFT) {
    // Move in Z direction based on mouse X
    sphereZ = map(mouseX, 0, width, -200, 200);
  } else {
    // Normal XY mouse movement
    sphereX = mouseX;
    sphereY = mouseY;
    sphereZ = 0;
  }
  
  translate(sphereX, sphereY, sphereZ);
  fill(255, 0, 0);
  sphere(50);
}
