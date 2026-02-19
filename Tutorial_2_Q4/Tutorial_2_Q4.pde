void setup() {
  size(400, 400);
}

void draw() {
  background(255);
  
  // Draw humans at different positions
  drawHuman(100, 200, 80, 150);
  drawHuman(250, 150, 100, 200);
}

void drawHuman(float x, float y, float w, float h) {
  // Calculate proportions
  float headSize = h * 0.25;
  float bodyHeight = h * 0.4;
  float bodyWidth = w * 0.6;
  float armLength = h * 0.3;
  float legLength = h * 0.35;
  
  // Head
  ellipse(x, y - headSize/2, headSize, headSize);
  
  // Body (rectangle from neck to waist)
  rect(x - bodyWidth/2, y, bodyWidth, bodyHeight);
  
  // Arms
  line(x - bodyWidth/2, y + bodyHeight/3, 
       x - bodyWidth/2 - armLength, y + bodyHeight/3 - armLength/2);
  line(x + bodyWidth/2, y + bodyHeight/3, 
       x + bodyWidth/2 + armLength, y + bodyHeight/3 - armLength/2);
  
  // Legs
  line(x - bodyWidth/4, y + bodyHeight, 
       x - bodyWidth/4 - legLength/2, y + bodyHeight + legLength);
  line(x + bodyWidth/4, y + bodyHeight, 
       x + bodyWidth/4 + legLength/2, y + bodyHeight + legLength);
}
