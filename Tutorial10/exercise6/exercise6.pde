import shapes3d.*;
import shapes3d.utils.*;
import peasy.*;

PeasyCam cam;
PGraphics pg;
Car[] cars = new Car[5];
float t = 0;

void setup() {
  size(800, 600, P3D);
  pg = createGraphics(width, height, P3D);
  cam = new PeasyCam(this, pg, 600);
  cam.setMinimumDistance(100);
  cam.setMaximumDistance(1000);

  cars[0] = new Car(0,    0, 0, 1.0, color(180, 30, 30));
  cars[1] = new Car(250,  0, 0, 1.2, color(30, 180, 30));
  cars[2] = new Car(500,  0, 0, 0.8, color(30, 30, 180));
  cars[3] = new Car(-250, 0, 0, 1.1, color(180, 180, 30));
  cars[4] = new Car(-500, 0, 0, 0.9, color(180, 30, 180));
}

void draw() {
  t += 0.01;

  pg.beginDraw();
  pg.background(50);
  pg.lights();
  pg.ambientLight(60, 60, 60);

  // All cars move along 3D curves
  for (int i = 0; i < cars.length; i++) {
    float offsetAngle = i * TWO_PI / cars.length;
    float newX = cars[i].baseX + sin(t + offsetAngle) * 80;
    float newY = cos(t * 1.5 + offsetAngle) * 40;
    float newZ = sin(t * 0.8 + offsetAngle) * 100;
    cars[i].moveTo(newX, newY, newZ);
  }

  // Car 2: rotates while moving
  cars[1].setRotY(t * 2);

  // Car 3: grows to max size
  float growScale = cars[2].baseScale + (2.0 - cars[2].baseScale) * (0.5 + 0.5 * sin(t));
  cars[2].setScale(growScale);

  // Car 4: fades out
  int alpha = (int)map(0.5 + 0.5 * sin(t), 0, 1, 0, 255);
  cars[3].setAlpha(alpha);

  for (int i = 0; i < cars.length; i++) {
    cars[i].display(pg);
  }

  pg.endDraw();
  cam.getState().apply(pg);
  image(pg, 0, 0);
}

class Car {
  float baseX, baseY, baseZ;
  float x, y, z;
  float baseScale, carScale;
  color carColor;
  float rotY = 0;
  int alpha = 255;

  Box carBody, carRoof;
  Ellipsoid wheel1, wheel2, wheel3, wheel4;

  Car(float carX, float carY, float carZ, float s, color c) {
    baseX = carX; baseY = carY; baseZ = carZ;
    x = carX; y = carY; z = carZ;
    baseScale = s; carScale = s;
    carColor = c;
    buildShapes();
  }

  void buildShapes() {
    carBody = new Box(160 * carScale, 50 * carScale, 70 * carScale);
    carBody.fill(carColor);
    carBody.stroke(color(red(carColor)*0.7, green(carColor)*0.7, blue(carColor)*0.7));
    carBody.moveTo(x, y, z);

    carRoof = new Box(85 * carScale, 32 * carScale, 65 * carScale);
    carRoof.fill(color(red(carColor)*0.85, green(carColor)*0.85, blue(carColor)*0.85));
    carRoof.stroke(color(red(carColor)*0.7, green(carColor)*0.7, blue(carColor)*0.7));
    carRoof.moveTo(x, y - 41 * carScale, z);

    wheel1 = new Ellipsoid(16*carScale, 44*carScale, 44*carScale, 24, 24);
    wheel1.fill(color(25, 25, 25)); wheel1.stroke(color(60, 60, 60));
    wheel1.moveTo(x - 52*carScale, y + 28*carScale, z + 46*carScale);

    wheel2 = new Ellipsoid(16*carScale, 44*carScale, 44*carScale, 24, 24);
    wheel2.fill(color(25, 25, 25)); wheel2.stroke(color(60, 60, 60));
    wheel2.moveTo(x + 52*carScale, y + 28*carScale, z + 46*carScale);

    wheel3 = new Ellipsoid(16*carScale, 44*carScale, 44*carScale, 24, 24);
    wheel3.fill(color(25, 25, 25)); wheel3.stroke(color(60, 60, 60));
    wheel3.moveTo(x - 52*carScale, y + 28*carScale, z - 46*carScale);

    wheel4 = new Ellipsoid(16*carScale, 44*carScale, 44*carScale, 24, 24);
    wheel4.fill(color(25, 25, 25)); wheel4.stroke(color(60, 60, 60));
    wheel4.moveTo(x + 52*carScale, y + 28*carScale, z - 46*carScale);
  }

  void moveTo(float nx, float ny, float nz) {
    x = nx; y = ny; z = nz;
    carBody.moveTo(x, y, z);
    carRoof.moveTo(x, y - 41 * carScale, z);
    wheel1.moveTo(x - 52*carScale, y + 28*carScale, z + 46*carScale);
    wheel2.moveTo(x + 52*carScale, y + 28*carScale, z + 46*carScale);
    wheel3.moveTo(x - 52*carScale, y + 28*carScale, z - 46*carScale);
    wheel4.moveTo(x + 52*carScale, y + 28*carScale, z - 46*carScale);
  }

  void setRotY(float ry) {
    rotY = ry;
    carBody.rotateTo(0, ry, 0);
    carRoof.rotateTo(0, ry, 0);
    wheel1.rotateTo(0, ry, 0);
    wheel2.rotateTo(0, ry, 0);
    wheel3.rotateTo(0, ry, 0);
    wheel4.rotateTo(0, ry, 0);
  }

  void setScale(float s) {
    carScale = s;
    buildShapes();
  }

  void setAlpha(int a) {
    alpha = a;
    carBody.fill(color(red(carColor), green(carColor), blue(carColor), alpha));
    carRoof.fill(color(red(carColor)*0.85, green(carColor)*0.85, blue(carColor)*0.85, alpha));
    wheel1.fill(color(25, 25, 25, alpha));
    wheel2.fill(color(25, 25, 25, alpha));
    wheel3.fill(color(25, 25, 25, alpha));
    wheel4.fill(color(25, 25, 25, alpha));
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
