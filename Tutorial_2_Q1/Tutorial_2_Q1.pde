// Button properties
int button1X = 100, button1Y = 100, buttonWidth = 100, buttonHeight = 50;
int button2X = 100, button2Y = 170;
int button3X = 100, button3Y = 240;

// Button colors
color gray = color(128);
color button1Color = gray;
color button2Color = gray;
color button3Color = gray;

void setup() {
  size(400, 400);
}

void draw() {
  background(255);
  
  // Draw buttons
  fill(button1Color);
  rect(button1X, button1Y, buttonWidth, buttonHeight);
  
  fill(button2Color);
  rect(button2X, button2Y, buttonWidth, buttonHeight);
  
  fill(button3Color);
  rect(button3X, button3Y, buttonWidth, buttonHeight);
  
  // Check mouse position
  checkButtonHover();
}

void checkButtonHover() {
  // Reset all buttons to gray
  button1Color = gray;
  button2Color = gray;
  button3Color = gray;
  
  // Check which button the mouse is over
  if (mouseX > button1X && mouseX < button1X + buttonWidth &&
      mouseY > button1Y && mouseY < button1Y + buttonHeight) {
    button1Color = color(255, 0, 0); // Red
  }
  else if (mouseX > button2X && mouseX < button2X + buttonWidth &&
           mouseY > button2Y && mouseY < button2Y + buttonHeight) {
    button2Color = color(0, 255, 0); // Green
  }
  else if (mouseX > button3X && mouseX < button3X + buttonWidth &&
           mouseY > button3Y && mouseY < button3Y + buttonHeight) {
    button3Color = color(0, 0, 255); // Blue
  }
}
