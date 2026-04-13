import shapes3d.utils.*;
import shapes3d.*;
import peasy.*;

Ellipsoid myEllipsoid;
Box myBox;
SkyDome mySkyDome;
DoubleCone myCone;

PeasyCam cam;

PGraphics pg;

void setup(){
  size(1000,800, P3D);  
  pg = createGraphics(1000, 800, P3D);
  cam = new PeasyCam(this, pg, 800);
  cam.setMinimumDistance(100);
  cam.setMaximumDistance(2000);
  
  // create different shapes
  myEllipsoid = new Ellipsoid(180, 250, 150, 20, 30);
  myEllipsoid.fill(color(0, 255, 255));
  myEllipsoid.drawMode(Shape3D.WIRE);
  myEllipsoid.moveTo(-150, -100, -150);
  
  myBox = new Box(50, 80, 30);
  myBox.fill(color(0, 0, 255));
  myBox.drawMode(Shape3D.ALL);
  myBox.moveTo(350, -200, 0);
  
  myCone = new DoubleCone(150, 80, 130, 150, 30);
  myCone.fill(color(255, 0, 0));
  myCone.drawMode(Shape3D.SOLID);
  myCone.moveTo(0, 50, -50);
  
  mySkyDome = new SkyDome(50, 200, 40, 50);
  mySkyDome.stroke(color(240, 50, 0));
  mySkyDome.fill(color(0, 250, 100));
  mySkyDome.drawMode(Shape3D.ALL);
  mySkyDome.moveTo(300, -100, 100);
}
void draw(){
  pg.beginDraw();
  
  myEllipsoid.rotateBy(0, radians(0.6), 0);
  myBox.rotateBy(0, radians(0.8), 0);
  mySkyDome.rotateByZ(radians(0.5));
  
  background(40);
 
  myEllipsoid.draw(pg);
  myBox.draw(pg);
  myCone.draw(pg);
  mySkyDome.draw(pg);
  
  pg.text("Sample 3DShapes", 100, 100, 0);
  
  pg.endDraw(); 
  cam.getState().apply(pg); 
  image(pg, 0, 0);
}