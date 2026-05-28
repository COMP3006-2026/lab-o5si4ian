import peasy.*;

PeasyCam cam;
float angle = 0;
float shuttleProgress = 0; // 0 to 1, where 0 is Earth, 1 is Moon
boolean shuttleMoving = true;

void setup() {
  size(800, 600, P3D);
  cam = new PeasyCam(this, 400);
}

void draw() {
  background(0);
  lights();
  
  // Draw Earth
  pushMatrix();
  fill(0, 0, 255);
  noStroke();
  sphere(50);
  popMatrix();
  
  // Update moon's orbit
  angle += 0.01;
  float moonX = cos(angle) * 150;
  float moonZ = sin(angle) * 150;
  
  // Draw Moon
  pushMatrix();
  translate(moonX, 0, moonZ);
  fill(128);
  noStroke();
  sphere(20);
  popMatrix();
  
  // Animate shuttle movement
  if (shuttleMoving) {
    shuttleProgress += 0.003;
    if (shuttleProgress >= 1.0) {
      shuttleProgress = 1.0;
      shuttleMoving = false;
    }
  }
  
  // Calculate shuttle position (linear interpolation between Earth and Moon)
  float shuttleX = moonX * shuttleProgress;
  float shuttleZ = moonZ * shuttleProgress;
  
  // Draw Space Shuttle (simple box)
  pushMatrix();
  translate(shuttleX, 0, shuttleZ);
  
  // Rotate shuttle to face direction of travel
  if (shuttleProgress > 0 && shuttleProgress < 1) {
    float angleToMoon = atan2(moonZ, moonX);
    rotateY(angleToMoon);
  }
  
  fill(200, 200, 200);
  box(15, 10, 25); // Length in Z direction
  
  // Add wings (smaller boxes)
  pushMatrix();
  translate(0, 0, -8);
  box(20, 2, 10);
  popMatrix();
  
  popMatrix();
  
  // Display flight progress
  pushMatrix();
  cam.beginHUD();
  fill(255);
  textSize(16);
  text("Shuttle Progress: " + nf(shuttleProgress * 100, 0, 1) + "%", 20, 40);
  if (!shuttleMoving) {
    text("Arrived at Moon!", 20, 70);
  }
  cam.endHUD();
  popMatrix();
}

// Press spacebar to restart the shuttle
void keyPressed() {
  if (key == ' ') {
    shuttleProgress = 0;
    shuttleMoving = true;
  }
}
