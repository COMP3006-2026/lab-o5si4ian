// The camera lifts up (controlled by mouseY) 
// while looking at the same point.
float eyeX = 0;
float eyeY = 0;
float eyeZ = 100;
void setup() {
  size(640, 360, P3D);
  fill(204);
}
void draw() {
  lights();
  background(0);
  
  // Change height of the camera with mouseY
  camera(eyeX, eyeY, eyeZ, // eyeX, eyeY, eyeZ
         0.0, 0.0, 0.0, // centerX, centerY, centerZ
         0, 1.0, 0.0); // upX, upY, upZ
  
  noStroke();
  box(90);
  stroke(255);
  line(-100, 0, 0, 100, 0, 0);
  line(0, -100, 0, 0, 100, 0);
  line(0, 0, -100, 0, 0, 100);
}

void mousePressed() {
}

void mouseDragged() {
  if (mouseButton == LEFT) {
    eyeX = eyeX + mouseX - pmouseX;
    eyeY = eyeY + mouseY - pmouseY;
  }
  else {
    eyeZ = eyeZ + mouseX - pmouseX;
  }
}