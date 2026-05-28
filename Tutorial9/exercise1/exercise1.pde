float[] px = new float[10], py = new float[10], pz = new float[10];
float[] sx = new float[10], sy = new float[10], sz = new float[10];
boolean[] isSphere = new boolean[10];

void setup() {
  size(800, 600, P3D);
  for (int i = 0; i < 10; i++) {
    px[i] = random(-300, 300);
    py[i] = random(-200, 200);
    pz[i] = random(-200, 200);
    sx[i] = random(20, 80);
    sy[i] = random(20, 80);
    sz[i] = random(20, 80);
    isSphere[i] = (random(1) > 0.5);
  }
}

void draw() {
  background(30);
  lights();

  for (int i = 0; i < 10; i++) {
    pushMatrix();
    translate(width/2 + px[i], height/2 + py[i], pz[i]);
    if (isSphere[i]) {
      sphere(sx[i]);
    } else {
      box(sx[i], sy[i], sz[i]);
    }
    popMatrix();
  }
}
