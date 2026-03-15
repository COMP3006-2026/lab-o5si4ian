/*
String[] lines = {"", "", ""};
int currentLine = 0;
int maxCharsPerLine = 30;

void setup() {
  size(600, 400);
  textSize(20);
}

void draw() {
  background(220);
  
  // Draw text area
  stroke(0);
  line(50, 150, 550, 150);
  line(50, 200, 550, 200);
  line(50, 250, 550, 250);
  
  // Display text
  fill(0);
  for (int i = 0; i < 3; i++) {
    text(lines[i], 50, 130 + i*50 + 20);
  }
  
  // Show cursor
  if (frameCount % 60 < 30) {
    float cursorX = 50 + textWidth(lines[currentLine]);
    float cursorY = 130 + currentLine*50 + 22;
    line(cursorX, cursorY - 15, cursorX, cursorY + 5);
  }
  
  // Instructions
  fill(100);
  text("Type to write (max " + maxCharsPerLine + " chars per line)", 50, 50);
  text("BACKSPACE to delete, ENTER for new line", 50, 80);
}

void keyPressed() {
  if (key == BACKSPACE) {
    if (lines[currentLine].length() > 0) {
      lines[currentLine] = lines[currentLine].substring(0, lines[currentLine].length() - 1);
    }
  } else if (key == ENTER || key == RETURN) {
    if (currentLine < 2) {
      currentLine++;
    }
  } else if (key >= ' ' && key <= '~') { // Printable characters
    if (lines[currentLine].length() < maxCharsPerLine) {
      lines[currentLine] += key;
    } else {
      // Auto-wrap to next line if available
      if (currentLine < 2) {
        currentLine++;
        lines[currentLine] = "" + key;
      }
    }
  }
}
*/
