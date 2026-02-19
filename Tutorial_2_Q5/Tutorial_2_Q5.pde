// Main class
Person p1, p2, p3, p4;

void setup() {
  size(600, 400);
  
  // Create 4 different person objects
  p1 = new Person(100, 200, 50, 100, color(255, 0, 0), 2, "horizontal");
  p2 = new Person(200, 200, 60, 120, color(0, 255, 0), 3, "vertical");
  p3 = new Person(300, 200, 70, 140, color(0, 0, 255), 1, "horizontal");
  p4 = new Person(400, 200, 80, 160, color(255, 255, 0), 2, "vertical");
}

void draw() {
  background(255);
  
  p1.display();
  p1.move();
  
  p2.display();
  p2.move();
  p2.bounce(); // Bounce for the second person
  
  p3.display();
  p3.move();
  
  p4.display();
  p4.move();
}

// Person class
class Person {
  float x, y;
  float width, height;
  color personColor;
  float speed;
  String direction;
  
  Person(float x, float y, float w, float h, color c, float s, String dir) {
    this.x = x;
    this.y = y;
    this.width = w;
    this.height = h;
    this.personColor = c;
    this.speed = s;
    this.direction = dir;
  }
  
  void display() {
    fill(personColor);
    
    // Calculate proportions
    float headSize = height * 0.25;
    float bodyHeight = height * 0.4;
    float bodyWidth = width * 0.6;
    float armLength = height * 0.3;
    float legLength = height * 0.35;
    
    // Head
    ellipse(x, y - headSize/2, headSize, headSize);
    
    // Body
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
  
  void move() {
    if (direction.equals("horizontal")) {
      x += speed;
    } else {
      y += speed;
    }
  }
  
  void bounce() {
    // Bounce off edges
    if (y < 50 || y > height - 50) {
      speed = -speed;
    }
  }
}
