int cols = 10;
int rows = 10;
int cellSize = 30;

void setup() {
  size(400, 400);
  noLoop(); // Stop continuous drawing
}

void draw() {
  background(255);
  
  // For loop to create grid
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      float gray = random(0, 255);
      fill(gray);
      rect(i * cellSize + 50, j * cellSize + 50, cellSize - 2, cellSize - 2);
    }
  }
}
