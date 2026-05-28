import shapes3d.*;
import shapes3d.utils.*;
import peasy.*;
PeasyCam cam;
PGraphics pg;

Car[] cars = new Car[5];

void setup() {
  size(800, 600, P3D);
  pg = createGraphics(width, height, P3D);
  cam = new PeasyCam(this, pg, 600);
  cam.setMinimumDistance(100);
  cam.setMaximumDistance(1000);
  
  // Create 5 cars with different positions, sizes, and colours
  cars[0] = new Car(0, 0, 0, 1.0, color(180, 30, 30));
  cars[1] = new Car(250, 0, 0, 1.2, color(30, 180, 30));
  cars[2] = new Car(500, 0, 0, 0.8, color(30, 30, 180));
  cars[3] = new Car(-250, 0, 0, 1.1, color(180, 180, 30));
  cars[4] = new Car(-500, 0, 0, 0.9, color(180, 30, 180));

}

void draw() {
  pg.beginDraw();
  background(50);
  lights();
  ambientLight(60, 60, 60);
  
  for (int i = 0; i < cars.length; i++) {
    cars[i].display(pg);
  }
  
  pg.endDraw();
  cam.getState().apply(pg);
  image(pg, 0, 0);
}

class Car {
  float x, y, z;
  float scale;
  color carColor;
  
  Box carBody, carRoof;
  Ellipsoid wheel1, wheel2, wheel3, wheel4;
  
  Car(float carX, float carY, float carZ, float carScale, color colorCar) {
    x = carX;
    y = carY;
    z = carZ;
    scale = carScale;
    carColor = colorCar;
    
    // --- Main car body ---
    carBody = new Box(160 * scale, 50 * scale, 70 * scale);
    carBody.fill(carColor);
    carBody.stroke(color(red(carColor)*0.7, green(carColor)*0.7, blue(carColor)*0.7));
    carBody.moveTo(x, y, z);
    
    // --- Roof ---
    carRoof = new Box(85 * scale, 32 * scale, 65 * scale);
    carRoof.fill(color(red(carColor)*0.85, green(carColor)*0.85, blue(carColor)*0.85));
    carRoof.stroke(color(red(carColor)*0.7, green(carColor)*0.7, blue(carColor)*0.7));
    carRoof.moveTo(x, y - 41 * scale, z);
    
    // --- Wheels ---
  wheel1 = new Ellipsoid(16 * scale, 44 * scale, 44 * scale, 24, 24);
  wheel1.fill(color(25, 25, 25));
  wheel1.stroke(color(60, 60, 60));
  wheel1.moveTo(x - 52 * scale, y + 28 * scale, z + 46 * scale);
  
  wheel2 = new Ellipsoid(16 * scale, 44 * scale, 44 * scale, 24, 24);
  wheel2.fill(color(25, 25, 25));
  wheel2.stroke(color(60, 60, 60));
  wheel2.moveTo(x + 52 * scale, y + 28 * scale, z + 46 * scale);
  
  wheel3 = new Ellipsoid(16 * scale, 44 * scale, 44 * scale, 24, 24);
  wheel3.fill(color(25, 25, 25));
  wheel3.stroke(color(60, 60, 60));
  wheel3.moveTo(x - 52 * scale, y + 28 * scale, z - 46 * scale);
  
  wheel4 = new Ellipsoid(16 * scale, 44 * scale, 44 * scale, 24, 24);
  wheel4.fill(color(25, 25, 25));
  wheel4.stroke(color(60, 60, 60));
  wheel4.moveTo(x + 52 * scale, y + 28 * scale, z - 46 * scale);
  }
  
  void display(PGraphics pg) {
    carBody.draw(pg);
    carRoof.draw(pg);
    wheel1.draw(pg);
    wheel2.draw(pg);
    wheel3.draw(pg);
    wheel4.draw(pg);
  }
}
