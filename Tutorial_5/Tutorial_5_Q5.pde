// Task 5: Analog watch with hour, minute, second hands

void setup() {
  size(400, 400);
}

void draw() {
  background(255);
  
  // Get current time
  int s = second();
  int m = minute();
  int h = hour() % 12; // Convert to 12-hour format
  
  // Draw clock face
  translate(width/2, height/2);
  stroke(0);
  strokeWeight(2);
  fill(255);
  ellipse(0, 0, 300, 300);
  
  // Draw hour markers
  for (int i = 0; i < 12; i++) {
    float angle = radians(i * 30 - 90);
    float x1 = 130 * cos(angle);
    float y1 = 130 * sin(angle);
    float x2 = 140 * cos(angle);
    float y2 = 140 * sin(angle);
    strokeWeight(i % 3 == 0 ? 3 : 1);
    line(x1, y1, x2, y2);
  }
  
  // Draw numbers
  fill(0);
  textAlign(CENTER, CENTER);
  for (int i = 1; i <= 12; i++) {
    float angle = radians(i * 30 - 90);
    float x = 120 * cos(angle);
    float y = 120 * sin(angle);
    text("" + i, x, y);
  }
  
  // Draw hands using polar coordinates
  // Second hand
  float secondAngle = radians(s * 6 - 90);
  float secondX = 120 * cos(secondAngle);
  float secondY = 120 * sin(secondAngle);
  stroke(255, 0, 0);
  strokeWeight(1);
  line(0, 0, secondX, secondY);
  
  // Minute hand
  float minuteAngle = radians((m + s/60.0) * 6 - 90);
  float minuteX = 100 * cos(minuteAngle);
  float minuteY = 100 * sin(minuteAngle);
  stroke(0);
  strokeWeight(2);
  line(0, 0, minuteX, minuteY);
  
  // Hour hand
  float hourAngle = radians((h + m/60.0) * 30 - 90);
  float hourX = 70 * cos(hourAngle);
  float hourY = 70 * sin(hourAngle);
  strokeWeight(4);
  line(0, 0, hourX, hourY);
  
  // Center dot
  fill(0);
  noStroke();
  ellipse(0, 0, 10, 10);
}
