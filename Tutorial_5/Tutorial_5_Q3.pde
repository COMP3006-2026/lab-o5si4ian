/*
String[] lines;
int currentShape = 0;

void setup() {
  size(600, 400);
  
  // Load the data file
  lines = loadStrings("data.txt");
  println("Loaded " + lines.length + " shapes");
}

void draw() {
  background(220);
  
  // Parse and draw all shapes from file
  for (int i = 0; i < lines.length; i++) {
    drawShapeFromLine(lines[i]);
  }
}

void drawShapeFromLine(String line) {
  // Split the line into parts
  String[] parts = splitTokens(line, " ,");
  
  if (parts.length > 0) {
    String shapeType = parts[0];
    
    if (shapeType.equals("ellipse") && parts.length >= 5) {
      float x = float(parts[1]);
      float y = float(parts[2]);
      float w = float(parts[3]);
      float h = float(parts[4]);
      fill(255, 200, 200);
      ellipse(x, y, w, h);
      
    } else if (shapeType.equals("line") && parts.length >= 5) {
      float x1 = float(parts[1]);
      float y1 = float(parts[2]);
      float x2 = float(parts[3]);
      float y2 = float(parts[4]);
      stroke(0);
      line(x1, y1, x2, y2);
      
    } else if (shapeType.equals("rect") && parts.length >= 5) {
      float x = float(parts[1]);
      float y = float(parts[2]);
      float w = float(parts[3]);
      float h = float(parts[4]);
      fill(200, 200, 255);
      rect(x, y, w, h);
    }
  }
}
*/
