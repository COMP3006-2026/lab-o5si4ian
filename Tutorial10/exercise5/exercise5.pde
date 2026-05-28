import shapes3d.*;
import shapes3d.utils.*;
import peasy.*;

PeasyCam cam;
PGraphics pg;
Car[] cars = new Car[5];
int selectedCar = -1;
float prevMouseX, prevMouseY;

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
  pg.beginDraw();
  pg.background(50);
  pg.lights();
  pg.ambientLight(60, 60, 60);

  for (int i = 0; i < cars.length; i++) {
    cars[i].display(pg);
  }

  pg.endDraw();
  cam.getState().apply(pg);
  image(pg, 0, 0);

  // HUD drawn on main canvas, not pg
  fill(255);
  noStroke();
  textSize(14);
  text("Drag: X/Y  |  Hold SHIFT + Drag: Z depth", 10, 20);
}

void mouseClicked() {
  Picked picked = Shape3D.pick(this, pg, mouseX, mouseY);
  if (picked != null) {
    for (int i = 0; i < cars.length; i++) {
      cars[i].resetColor();
    }
    for (int i = 0; i < cars.length; i++) {
      if (picked.shape == cars[i].carBody || picked.shape == cars[i].carRoof ||
          picked.shape == cars[i].wheel1  || picked.shape == cars[i].wheel2  ||
          picked.shape == cars[i].wheel3  || picked.shape == cars[i].wheel4) {
        cars[i].brighten();
        selectedCar = i;
        cam.setActive(false);
        break;
      }
    }
  } else {
    selectedCar = -1;
    cam.setActive(true);
  }
  prevMouseX = mouseX;
  prevMouseY = mouseY;
}

void mouseDragged() {
  if (selectedCar != -1) {
    float dx = mouseX - prevMouseX;
    float dy = mouseY - prevMouseY;

    if (keyPressed && keyCode == SHIFT) {
      cars[selectedCar].move(0, 0, dy);
    } else {
      cars[selectedCar].move(dx, dy, 0);
    }
  }
  prevMouseX = mouseX;
  prevMouseY = mouseY;
}

void mouseReleased() {
  if (selectedCar == -1) {
    cam.setActive(true);
  }
}

class Car {
  float x, y, z;
  float carScale;
  color carColor;

  Box carBody, carRoof;
  Ellipsoid wheel1, wheel2, wheel3, wheel4;

  Car(float carX, float carY, float carZ, float s, color c) {
    x = carX; y = carY; z = carZ;
    carScale = s; carColor = c;
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

  void move(float dx, float dy, float dz) {
    x += dx; y += dy; z += dz;
    carBody.moveTo(x, y, z);
    carRoof.moveTo(x, y - 41 * carScale, z);
    wheel1.moveTo(x - 52*carScale, y + 28*carScale, z + 46*carScale);
    wheel2.moveTo(x + 52*carScale, y + 28*carScale, z + 46*carScale);
    wheel3.moveTo(x - 52*carScale, y + 28*carScale, z - 46*carScale);
    wheel4.moveTo(x + 52*carScale, y + 28*carScale, z - 46*carScale);
  }

  void resetColor() {
    carBody.fill(carColor);
    carRoof.fill(color(red(carColor)*0.85, green(carColor)*0.85, blue(carColor)*0.85));
  }

  void brighten() {
    carBody.fill(color(255, 255, 100));
    carRoof.fill(color(255, 255, 150));
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
