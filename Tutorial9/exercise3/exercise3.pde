import shapes3d.*;
import shapes3d.utils.*;
import peasy.*;
PeasyCam cam;
PGraphics pg;

Box carBody, carRoof; 
Ellipsoid wheel1, wheel2, wheel3, wheel4;

void setup() {
  size(800, 600, P3D);
  pg = createGraphics(width, height, P3D);
  cam = new PeasyCam(this, pg, 600);
  cam.setMinimumDistance(100);
  cam.setMaximumDistance(1000);

  // --- Main car body ---
  carBody = new Box(160, 50, 70);
  carBody.fill(color(180, 30, 30));
  carBody.stroke(color(120, 20, 20));
  carBody.moveTo(0, 0, 0);

  // --- Roof ---
  carRoof = new Box(85, 32, 65);
  carRoof.fill(color(155, 25, 25));
  carRoof.stroke(color(120, 20, 20));
  carRoof.moveTo(-5, -41, 0);

  // --- Wheels (flat boxes) ---
  wheel1 = new Ellipsoid(16, 44, 44);
  wheel1.fill(color(25, 25, 25));
  wheel1.stroke(color(60, 60, 60));
  wheel1.moveTo(-52, 28, 46);

  wheel2 = new Ellipsoid(16, 44, 44);
  wheel2.fill(color(25, 25, 25));
  wheel2.stroke(color(60, 60, 60));
  wheel2.moveTo(52, 28, 46);

  wheel3 = new Ellipsoid(16, 44, 44);
  wheel3.fill(color(25, 25, 25));
  wheel3.stroke(color(60, 60, 60));
  wheel3.moveTo(-52, 28, -46);

  wheel4 = new Ellipsoid(16, 44, 44);
  wheel4.fill(color(25, 25, 25));
  wheel4.stroke(color(60, 60, 60));
  wheel4.moveTo(52, 28, -46);


}

void draw() {
  pg.beginDraw();
  background(50);
  lights();
  ambientLight(60, 60, 60);

  carBody.draw(pg);
  carRoof.draw(pg);
  wheel1.draw(pg);
  wheel2.draw(pg);
  wheel3.draw(pg);
  wheel4.draw(pg);
  
  pg.endDraw();
  cam.getState().apply(pg);
  image(pg,0,0);
}
