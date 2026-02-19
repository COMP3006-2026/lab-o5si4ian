int cols = 10;
int rows = 10;
int cellSize = 30;

void setup() {
  size(400, 400);
  //noLoop();
}

void draw() {
  background(255);
  
  int i = 0;
  while (i < cols) {
    int j = 0;
    while (j < rows) {
      float colors1 = random(0, 255);
      float colors2 = random(0, 255);
      float colors3 = random(0, 255);
      fill(colors1, colors2, colors3);
      rect(i * cellSize + 50, j * cellSize + 50, cellSize - 2, cellSize - 2);
      j++;
    }
    i++;
  }
}
