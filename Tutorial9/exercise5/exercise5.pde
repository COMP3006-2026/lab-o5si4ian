import shapes3d.*;
import shapes3d.utils.*;

Ellipsoid sun, earth, moon;
float earthAngle = 0, moonAngle = 0;
float EARTH_ORBIT = 250;
float MOON_ORBIT = 80;

PImage earthImg, moonImg, sunImg;
PGraphics pg;

// Camera control variables
float camX = 0, camY = 200, camZ = 800;  // Camera position
float centerX = 0, centerY = 0, centerZ = 0;  // Point camera is looking at
float speed = 10;  // Camera movement speed

void setup() {
  size(1000, 1000, P3D);
  
  // Initialize offscreen buffer
  pg = createGraphics(width, height, P3D);
  
  // Load textures
  sunImg = loadImage("data/sun.jpg");
  earthImg = loadImage("data/earth.jpg");
  moonImg = loadImage("data/moon.jpg");
  
  // Create Sun 
  sun = new Ellipsoid(120, 400, 400); 
  sun.texture(sunImg);
  sun.drawMode(Shape3D.TEXTURE);
  
  // Create Earth
  earth = new Ellipsoid(50, 250, 250);  
  earth.texture(earthImg);
  earth.drawMode(Shape3D.TEXTURE);
  
  // Create Moon
  moon = new Ellipsoid(15, 80, 80); 
  moon.texture(moonImg);
  moon.drawMode(Shape3D.TEXTURE);
}

void draw() {
  // Handle camera movement
  handleCamera();
  
  background(0);
  
  // Start drawing to offscreen buffer
  pg.beginDraw();
  pg.background(0);
  
  // Set up camera in the offscreen buffer
  pg.camera(camX, camY, camZ, centerX, centerY, centerZ, 0, 1, 0);
  
  pg.lights();
  pg.pointLight(255, 255, 200, width/2, height/2, 0);
  pg.ambientLight(180, 180, 180);
  
  // Draw Sun at center (0,0,0 in the 3D space, but we'll position everything relative to center)
  pg.pushMatrix();
  pg.translate(width/2, height/2, 0);
  sun.draw(pg);
  
  // Calculate Earth position - rotating around the sun (which is at 0,0,0 after translation)
  earthAngle += 0.01;
  float earthX = cos(earthAngle) * EARTH_ORBIT;
  float earthZ = sin(earthAngle) * EARTH_ORBIT;
  
  pg.pushMatrix();
  pg.translate(earthX, 0, earthZ);
  earth.draw(pg);
  
  // Calculate Moon position - rotating around Earth
  moonAngle += 0.05;
  float moonX = cos(moonAngle) * MOON_ORBIT;
  float moonZ = sin(moonAngle) * MOON_ORBIT;
  
  pg.pushMatrix();
  pg.translate(moonX, 0, moonZ);
  moon.draw(pg);
  pg.popMatrix();
  
  pg.popMatrix();
  pg.popMatrix();
  
  pg.endDraw();
  
  // Draw the buffer
  image(pg, 0, 0);
  
  // Display camera position info
  fill(255);
  text("Camera Position - X: " + nf(camX, 0, 1) + 
       " Y: " + nf(camY, 0, 1) + 
       " Z: " + nf(camZ, 0, 1), 10, 30);
  text("WASD to move camera | Q/E to move up/down", 10, 50);
}

void handleCamera() {
  // W - Move camera forward (closer to center)
  if (keyPressed && key == 'w') {
    camZ -= speed;
  }
  // S - Move camera backward (further from center)
  if (keyPressed && key == 's') {
    camZ += speed;
  }
  // A - Move camera left
  if (keyPressed && key == 'a') {
    camX -= speed;
  }
  // D - Move camera right
  if (keyPressed && key == 'd') {
    camX += speed;
  }
  // Q - Move camera up
  if (keyPressed && key == 'q') {
    camY -= speed;
  }
  // E - Move camera down
  if (keyPressed && key == 'e') {
    camY += speed;
  }
  
  // Optional: Keep camera looking at the center of the scene
  centerX = width/2;
  centerY = height/2;
  centerZ = 0;
}
