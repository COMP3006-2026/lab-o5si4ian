import shapes3d.*;
import shapes3d.utils.*;
import peasy.*;
PeasyCam cam;

Ellipsoid sun, earth, moon;
float earthAngle = 0, moonAngle = 0;
float EARTH_ORBIT = 400;
float MOON_ORBIT = 90;

PImage earthImg, moonImg, sunImg;
PGraphics pg;

void setup() {
  size(1000, 1000, P3D);
  
  // Initialize offscreen buffer
  pg = createGraphics(width, height, P3D);
  
         
  // Initialize camera
    cam = new PeasyCam(this, pg, 800);
    cam.setMinimumDistance(300);
    cam.setMaximumDistance(2000);
  
  // Load textures
  sunImg = loadImage("sun.jpg");
  earthImg = loadImage("earth.jpg");
  moonImg = loadImage("moon.png");
  
  // Create Sun
  sun = new Ellipsoid(200, 32, 32);
  sun.texture(sunImg);
  sun.drawMode(Shape3D.TEXTURE);
  
  // Create Earth
  earth = new Ellipsoid(80, 24, 24);
  earth.texture(earthImg);
  earth.drawMode(Shape3D.TEXTURE);
  
  // Create Moon
  moon = new Ellipsoid(14, 16, 16);
  moon.texture(moonImg);
  moon.drawMode(Shape3D.TEXTURE);
}

void draw() {
  
  background(0);
  
  // Start drawing to offscreen buffer
  pg.beginDraw();
  
  pg.background(0);
  pg.lights();
  pg.pointLight(255, 255, 200, 0, 0, 0);
  pg.ambientLight(180, 180, 180);
  
  
  // Draw Sun (center)
  sun.draw(pg);
  
  // Calculate Earth position
  earthAngle += 0.01;
  float earthX = cos(earthAngle) * EARTH_ORBIT;
  float earthZ = sin(earthAngle) * EARTH_ORBIT;
  earth.moveTo(new PVector(earthX, 0, earthZ));
  earth.draw(pg);
  
  // Calculate Moon position
  moonAngle += 0.05;
  float moonX = earthX + cos(moonAngle) * MOON_ORBIT;
  float moonZ = earthZ + sin(moonAngle) * MOON_ORBIT;
  moon.moveTo(new PVector(moonX, 0, moonZ));
  moon.draw(pg);
  
  pg.endDraw();
  
  // Apply PeasyCam transformation and draw the buffer
  cam.getState().apply(pg);
  image(pg, 0, 0);
}
