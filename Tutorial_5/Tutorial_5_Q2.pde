/*
float rectX = 200, rectY = 200, rectW = 80, rectH = 60;
float circleX = 400, circleY = 200, circleR = 35;

boolean draggingRect = false;
boolean draggingCircle = false;
float offsetX, offsetY;

void setup() {
  size(600, 400);
  // Randomize sizes
  rectW = random(40, 120);
  rectH = random(30, 100);
  circleR = random(20, 60);
}

void draw() {
  background(220);
  
  // Update positions while dragging
  if (draggingRect) {
    rectX = mouseX + offsetX;
    rectY = mouseY + offsetY;
  }
  if (draggingCircle) {
    circleX = mouseX + offsetX;
    circleY = mouseY + offsetY;
  }
  
  // Draw rectangle
  fill(200, 100, 100);
  rect(rectX, rectY, rectW, rectH);
  
  // Draw circle
  fill(100, 200, 100);
  ellipse(circleX, circleY, circleR*2, circleR*2);
}

void mousePressed() {
  // Check if clicking on rectangle
  if (mouseX > rectX && mouseX < rectX + rectW && 
      mouseY > rectY && mouseY < rectY + rectH) {
    draggingRect = true;
    offsetX = rectX - mouseX;
    offsetY = rectY - mouseY;
  }
  // Check if clicking on circle
  else if (dist(mouseX, mouseY, circleX, circleY) < circleR) {
    draggingCircle = true;
    offsetX = circleX - mouseX;
    offsetY = circleY - mouseY;
  }
}

void mouseReleased() {
  draggingRect = false;
  draggingCircle = false;
}
*/
