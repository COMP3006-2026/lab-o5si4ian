float[] px = new float[10], py = new float[10], pz = new float[10];
float[] sx = new float[10], sy = new float[10], sz = new float[10];
boolean[] isSphere = new boolean[10];
boolean[] hasFill = new boolean[10];
boolean[] hasStroke = new boolean[10];
color[] shapeColor = new color[10];
color[] palette = new color[3];

void setup() {
  size(800, 600, P3D);
  palette[0] = color(255, 0, 0);
  palette[1] = color(0, 255, 0);
  palette[2] = color(0, 0, 255);

  for (int i = 0; i < 10; i++) {
    px[i] = random(-300, 300);
    py[i] = random(-200, 200);
    pz[i] = random(-200, 200);
    sx[i] = random(20, 80);
    sy[i] = random(20, 80);
    sz[i] = random(20, 80);
    isSphere[i]  = (random(1) > 0.5);
    hasFill[i]   = (random(1) > 0.5);
    hasStroke[i] = (random(1) > 0.5);
    shapeColor[i] = palette[(int)random(3)];
  }
}

void draw() {
  background(30);
  lights();

  for (int i = 0; i < 10; i++) {
    pushMatrix();
    translate(width/2 + px[i], height/2 + py[i], pz[i]);

    if (hasFill[i]) {
      fill(shapeColor[i]);
    } else {
      noFill();
    }

    if (hasStroke[i]) {
      stroke(255);
      strokeWeight(1.5);
    } else {
      noStroke();
    }

    if (isSphere[i]) {
      sphere(sx[i]);
    } else {
      box(sx[i], sy[i], sz[i]);
    }
    popMatrix();
  }
}
