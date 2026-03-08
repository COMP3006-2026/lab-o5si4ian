/*
void setup() {
  size(800, 600);
  background(255);
  
  // Original green rectangle
  fill(0, 255, 0);
  rect(200, 200, 50, 50);
  
  // Scale the second shape multiple times
  for (int i = 1; i <= 3; i++) {
    pushMatrix();
    translate(200 + i * 80, 200);
    scale(1.0 + i * 0.5); 
    
    fill(0, 255, 0, 100 - i * 20);
    rect(0, 0, 50, 50);
    popMatrix();
  }
}
*/
