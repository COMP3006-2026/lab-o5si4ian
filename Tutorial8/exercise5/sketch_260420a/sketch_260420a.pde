import shapes3d.utils.*;
import shapes3d.*;
import peasy.*;
PGraphics pg;
PeasyCam cam;
Shape3D[] shapes = new Shape3D[20];
float a;
void setup(){
  size(1000,800,P3D);
  pg = createGraphics(width, height, P3D);
  cam = new PeasyCam(this, pg, 1000);
  cam.setMinimumDistance(100);
  cam.setMaximumDistance(2000);
  
  cursor(CROSS);
  float size;
  for (int i = 0; i < shapes.length; i++) {
    size = 10 + (int)random(80);
    int type = (int)(random(10));
    if (type % 2 == 0) {
      shapes[i] = new Box(size,size,size);
    }
    
    else {
      Ellipsoid e = new 
Ellipsoid(size,size,size, 20,30);
      shapes[i] = e;
    }
shapes[i].pickable(true);
    shapes[i].moveTo(random(
width/2,height/2), random(
width/2,height/2), random(
width/2,height/2));
    shapes[i].fill(randomColor());
    shapes[i].stroke(color(64,0,64));
    shapes[i].strokeWeight(1.2);
    shapes[i].drawMode(Shape3D.SOLID);
  }
}    
    void draw(){
  pg.beginDraw();
  background(128);
  ambientLight(200,200,200);
  directionalLight(128, 128, 128, -1, 0, -1);
  for (int i = 0; i < shapes.length; i++) {
    shapes[i].draw(pg);
  }
  pg.endDraw(); 
  cam.getState().apply(pg); 
  image(pg, 0, 0);
}
void mouseClicked(){
  Picked picked = Shape3D.pick(this, pg, mouseX, 
mouseY);
  if(picked != null) {
      picked.shape.fill(color(0,0,255));
    }
}
int randomColor(){
  return color(random(160,200), random(20,160), 
random(160,200));
}
