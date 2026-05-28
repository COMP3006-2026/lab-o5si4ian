/*
float rectX = 200, rectY = 200;
float circleX = 400, circleY = 200;
int selectedShape = 1; // 1 for rectangle, 2 for circle
float moveSpeed = 5;

void setup() {
  size(600, 400);
}

void draw() {
  background(220);
  
  // Draw rectangle
  fill(selectedShape == 1 ? color(255, 0, 0) : color(150) //this is used to change the colour when the condition is met. For this, it is when 2 is pressed
  );
  rect(rectX, rectY, 80, 60);
  
  // Draw circle
  fill(selectedShape == 2 ? color(0, 255, 0) : color(150)//this is used to change the colour when the condition is met. For this, it is when 1 is pressed
  );
  ellipse(circleX, circleY, 70, 70);
  
  // Display instructions
  fill(0);
  text("Press '1' to select rectangle, '2' to select circle", 10, 20);
  text("Use arrow keys to move selected shape", 10, 40);
}

void keyPressed() {
  if (key == '1') {
    selectedShape = 1;
  } else if (key == '2') {
    selectedShape = 2;
  } else if (keyCode == UP) {
    if (selectedShape == 1) rectY -= moveSpeed;
    else circleY -= moveSpeed;
  } else if (keyCode == DOWN) {
    if (selectedShape == 1) rectY += moveSpeed;
    else circleY += moveSpeed;
  } else if (keyCode == LEFT) {
    if (selectedShape == 1) rectX -= moveSpeed;
    else circleX -= moveSpeed;
  } else if (keyCode == RIGHT) {
    if (selectedShape == 1) rectX += moveSpeed;
    else circleX += moveSpeed;
  }
}
*/
