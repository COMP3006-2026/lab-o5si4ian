// Global variables
PImage[] earthFrames = new PImage[240];
PImage moonImg;
int currentFrame = 0;
float angle = 0;
float moonAngle = 0;
float moonOrbitRadius = 200;
float earthX, earthY;
float moonX, moonY;

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
  
}
void drawEarthAndMoon() {
  // Update angles
  angle += 0.02; // Earth rotation speed
  moonAngle += 0.01; // Moon orbit speed
  
  // Calculate moon position
  moonX = earthX + cos(moonAngle) * moonOrbitRadius;
  moonY = earthY + sin(moonAngle) * moonOrbitRadius;

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
  image(moonImg, moonX - 25, moonY - 25, 50, 50);
}
