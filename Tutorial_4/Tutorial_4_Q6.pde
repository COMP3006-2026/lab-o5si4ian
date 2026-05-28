/*
String[] numbers = new String[0];  
boolean isFloat = false;
String currentInput = "";

void setup() {
  size(400, 300);
  textSize(20);
}

void draw() {
  background(255);
  
  // Display current input
  fill(0);
  text("Enter number: " + currentInput, 50, 100);
  
  if (isFloat) {
    text("(Decimal number mode)", 50, 140);
  } else {
    text("(Integer mode - press '.' for decimal)", 50, 140);
  }
  
  // Display all entered numbers
  text("Entered numbers:", 50, 200);
  for (int i = 0; i < numbers.length; i++) {
    text(numbers[i], 70, 230 + i * 25);
  }
  
  // Instructions
  textSize(14);
  text("SPACE = save number | ENTER = save file & exit", 50, 280);
}

void keyPressed() {
  if (key == '.') {
    isFloat = true;
    currentInput += key;
  }
  else if (key >= '0' && key <= '9') {
    currentInput += key;
  }
  else if (key == BACKSPACE && currentInput.length() > 0) {
    currentInput = currentInput.substring(0, currentInput.length() - 1);
    // Check if still has decimal point
    isFloat = currentInput.contains(".");
  }
  else if (key == ' ') {  // Spacebar pressed - save number
    if (currentInput.length() > 0) {
      // Format the number based on type
      String formattedNumber;
      float num = float(currentInput);
      
      if (isFloat) {
        // For float: 6 digits left, 4 digits right of decimal
        formattedNumber = nf(num, 6, 4);
      } else {
        // For integer: 10 digits total
        formattedNumber = nf(int(num), 10);
      }
      
      // Add to array (like append(x, mouseX))
      numbers = append(numbers, formattedNumber);
      
      // Reset for next input
      currentInput = "";
      isFloat = false;
    }
  }
  else if (key == ENTER || key == RETURN) {
    // Save all numbers to file (like saveStrings in example)
    saveStrings("words.txt", numbers);
    exit();  // Stop the program (like in example)
  }
}
*/
