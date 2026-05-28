
/**
Earth, Moon and Stars
*/

import shapes3d.utils.*;
import shapes3d.*;
import peasy.*;
PeasyCam cam;

Ellipsoid earth, moon, stars;
ShapeGroup earth_moon;

PImage earthImg, moonImg, starsImg;
PGraphics pg;

void setup(){
  size(1000,1000, P3D);
  pg = createGraphics(1000, 1000, P3D);	
  cam = new PeasyCam(this, pg, 800);
  cam.setMinimumDistance(300);
  cam.setMaximumDistance(2000);

  // Create the earth
  earth = new Ellipsoid(200, 50 ,50);
  earthImg = loadImage("data/earth.jpg");
  earth.texture(earthImg);
  earth.moveTo(new PVector(0, 0, 0));
  earth.drawMode(Shape3D.TEXTURE);
  
  // Create the moon
  moon = new Ellipsoid(40,20,35);
  moonImg = loadImage("data/moon.jpg");
  moon.texture(moonImg);
  moon.moveTo(0,0,420);
  moon.drawMode(Shape3D.TEXTURE);

  // Create the star background
  stars = new Ellipsoid(3000,50,50);
  starsImg = loadImage("data/stars01.jpg");
  stars.texture(starsImg);
  stars.drawMode(Shape3D.TEXTURE);

  // Add the moon and the earth to a group  
  // its position relative to the earth's
  earth_moon = new ShapeGroup();
  earth_moon.addChild(earth);
  earth_moon.addChild(moon);
}

void draw(){
  pg.beginDraw();
  // Change the rotations before drawing
  earth_moon.rotateBy(0, radians(1), 0);
  moon.rotateBy(0, radians(4.0), 0);
  stars.rotateBy(0, 0, radians(0.1));
  
  background(40);

  //camera(0, -190, 350, 0, 0, 0, 0, 1, 0);
  ambientLight(80,80,80);
  directionalLight(255, 255, 255, -150, 150, -80);

  // Draw the earth (will cause all added shapes
  // to be drawn i.e. the moon)
  earth_moon.draw(pg);

  // Reset the lights
  noLights();
  ambientLight(180,180,180);
  stars.draw(pg);

  pg.endDraw();
  
  cam.getState().apply(pg); 
  image(pg, 0, 0);
}