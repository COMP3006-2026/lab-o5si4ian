Person[] persons = new Person[10];

void setup() {
  size(800, 600);
  
  // Create 10 random persons
  for (int i = 0; i < persons.length; i++) {
    float x = random(100, 700);
    float y = random(100, 500);
    float w = random(30, 80);
    float h = random(60, 200);
    color c = color(random(255), random(255), random(255));
    float speedX = random(-3, 3);
    float speedY = random(-3, 3);
    
    persons[i] = new Person(x, y, w, h, c, speedX, speedY);
  }
  
  // Sort by height
  sortPersonsByHeight();
}

void draw() {
  background(255);
  
  // Move and display all persons
  for (int i = 0; i < persons.length; i++) {
    persons[i].move();
    persons[i].bounce();
    persons[i].display();
  }
}

void sortPersonsByHeight() {
  // Bubble sort by height
  for (int i = 0; i < persons.length - 1; i++) {
    for (int j = 0; j < persons.length - i - 1; j++) {
      if (persons[j].height > persons[j + 1].height) {
        Person temp = persons[j];
        persons[j] = persons[j + 1];
        persons[j + 1] = temp;
      }
    }
  }
}

// Person class for Challenge
class Person {
  float x, y;
  float width, height;
  color personColor;
  float speedX, speedY;
  
  Person(float x, float y, float w, float h, color c, float sx, float sy) {
    this.x = x;
    this.y = y;
    this.width = w;
    this.height = h;
    this.personColor = c;
    this.speedX = sx;
    this.speedY = sy;
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
    x += speedX;
    y += speedY;
  }
  
  void bounce() {
    // Bounce off edges
    if (x < 50 || x > width - 50) {
      speedX = -speedX;
    }
    if (y < 50 || y > height - 50) {
      speedY = -speedY;
    }
  }
}
