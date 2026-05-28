// Global variables
PImage[] earthFrames = new PImage[240];
PImage moonImg;
int currentFrame = 0;
float angle = 0;
float moonAngle = 0;
float moonOrbitRadius = 200;
float earthX, earthY;
float moonX, moonY;

// Task 2: Motion blur variables
ArrayList<PVector> moonTrail = new ArrayList<PVector>();
int trailLength = 15;

// Task 3: Space shuttle variables
boolean shuttleLaunched = false;
float shuttleT = 0; // 0 at Earth, 1 at Moon
float shuttleSpeed = 0;
PVector shuttlePos;
float[] shuttleXPoints = {-15, 0, 15, 10, 0, -10};
float[] shuttleYPoints = {0, -20, 0, 5, 10, 5};
boolean shuttleComplete = false;


void setup() {
  size(800, 600);
  earthX = width/2;
  earthY = height/2;
  
  // Load Earth sprites (earth0.png to earth239.png)
  for (int i = 0; i < 240; i++) {
    earthFrames[i] = loadImage("../earth/" + i + ".gif");
    if (earthFrames[i] == null) {
      println("Could not load earth" + i + ".gif");
      // Create a fallback colored circle if images not found
      earthFrames[i] = createImage(100, 100, RGB);
    }
  }
  
  // Load Moon image
  moonImg = loadImage("../moon-icon.png");
  if (moonImg == null) {
    println("Could not load moon-icon.png");
    moonImg = createImage(50, 50, RGB);
  }
  
  frameRate(60);
}

void draw() {
  background(0);
  
  // Task 1: Earth rotation and Moon orbit
  drawEarthAndMoon();
  
  // Task 2: Motion blur for Moon
  if (moonTrail.size() > 0) {
    drawMotionBlur();
  }
  
  // Task 3: Space shuttle
  if (shuttleLaunched && !shuttleComplete) {
    updateShuttle();
    drawShuttle();
  }
  
  // Instructions
  fill(255);
  textSize(12);
  text("Press 'S' to launch space shuttle from Earth to Moon", 20, 30);
  
  if (shuttleComplete) {
    fill(0, 255, 0);
    text("Shuttle has reached the Moon!", width/2 - 100, height - 30);
  }
}

void drawEarthAndMoon() {
  // Update angles
  angle += 0.02; // Earth rotation speed
  moonAngle += 0.01; // Moon orbit speed
  
  // Calculate moon position
  moonX = earthX + cos(moonAngle) * moonOrbitRadius;
  moonY = earthY + sin(moonAngle) * moonOrbitRadius;
  
  // Add current moon position to trail for motion blur (Task 2)
  if (shuttleLaunched || moonTrail.size() > 0) {
    moonTrail.add(0, new PVector(moonX, moonY));
    if (moonTrail.size() > trailLength) {
      moonTrail.remove(moonTrail.size() - 1);
    }
  } else {
    // Always track moon position for when shuttle launches
    moonTrail.add(0, new PVector(moonX, moonY));
    if (moonTrail.size() > trailLength) {
      moonTrail.remove(moonTrail.size() - 1);
    }
  }
  
  // Draw Earth (Task 1: rotating)
  pushMatrix();
  translate(earthX, earthY);
  rotate(angle);
  if (earthFrames[currentFrame] != null) {
    image(earthFrames[currentFrame], -50, -50, 100, 100);
  } else {
    fill(0, 0, 255);
    ellipse(0, 0, 100, 100);
  }
  popMatrix();
  
  // Update Earth frame for rotation animation
  currentFrame = (currentFrame + 1) % 240;
}

void drawMotionBlur() {
  // Draw motion blur trail for Moon (Task 2)
  for (int i = 0; i < moonTrail.size(); i++) {
    float alpha = map(i, 0, moonTrail.size(), 100, 20);
    float size = map(i, 0, moonTrail.size(), 50, 30);
    PVector pos = moonTrail.get(i);
    
    fill(200, 200, 200, alpha);
    noStroke();
    ellipse(pos.x, pos.y, size, size);
  }
  
  // Draw current Moon
    image(moonImg, moonX - 25, moonY - 25, 50, 50);
}

void updateShuttle() {
  // Calculate position along path from Earth to Moon (straight line)
  if (shuttleT < 1.0) {
    // Update progress based on speed
    shuttleT += shuttleSpeed;
    
    if (shuttleT >= 1.0) {
      shuttleT = 1.0;
      shuttleComplete = true;
    }
    
    // Calculate shuttle position
    float currentX = lerp(earthX, moonX, shuttleT);
    float currentY = lerp(earthY, moonY, shuttleT);
    shuttlePos = new PVector(currentX, currentY);
    
    // Update speed: accelerate to midpoint, then decelerate
    float midpoint = 0.5;
    float maxSpeed = 0.02;
    
    if (shuttleT < midpoint) {
      // Accelerating phase
      shuttleSpeed = map(shuttleT, 0, midpoint, 0.002, maxSpeed);
    } else {
      // Decelerating phase
      shuttleSpeed = map(shuttleT, midpoint, 1.0, maxSpeed, 0.002);
    }
  }
}

void drawShuttle() {
  if (shuttlePos != null) {
    pushMatrix();
    translate(shuttlePos.x, shuttlePos.y);
    
    // Calculate angle to face direction of travel
    float angleToTarget = atan2(moonY - earthY, moonX - earthX);
    rotate(angleToTarget);
    
    // Draw shuttle as polygon
    fill(255, 100, 100);
    stroke(255);
    strokeWeight(2);
    beginShape();
    for (int i = 0; i < shuttleXPoints.length; i++) {
      vertex(shuttleXPoints[i], shuttleYPoints[i]);
    }
    endShape(CLOSE);
    
    // Add engine glow effect
    fill(255, 200, 0, 150);
    noStroke();
    triangle(-15, -3, -25, 0, -15, 3);
    
    popMatrix();
  }
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    if (!shuttleLaunched && !shuttleComplete) {
      shuttleLaunched = true;
      shuttleT = 0;
      shuttleSpeed = 0.002;
      shuttlePos = new PVector(earthX, earthY);
    } else if (shuttleComplete) {
      // Reset shuttle
      shuttleLaunched = false;
      shuttleComplete = false;
      shuttleT = 0;
      moonTrail.clear();
    }
  }
}
