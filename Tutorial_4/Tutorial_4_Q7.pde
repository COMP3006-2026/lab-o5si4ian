/*
void setup() {
  // Load the CSV file (like loadStrings("position.txt"))
  String[] lines = loadStrings("T4q7.csv");
  
  int males = 0;
  int females = 0;
  int bornAfter2003 = 0;
  
  // Loop through each line (like for loop in example)
  for (int i = 0; i < lines.length; i++) {
    // Split the line at commas (CSV file) instead of tabs
    // The example used: split(lines[i], '\t')
    String[] pieces = split(lines[i], ',');
    
    // Check if we have enough pieces (like checking pieces.length == 2)
    // Assuming CSV has at least 4 columns: ID, Name, DOB, Gender
    if (pieces.length >= 4) {
      
      // Get the values (like int x = int(pieces[0]))
      String gender = pieces[3].trim();  // Gender column (4th column)
      String dob = pieces[2].trim();     // DOB column (3rd column)
      
      // Count males and females
      if (gender.equalsIgnoreCase("M")) {
        males++;
      } else if (gender.equalsIgnoreCase("F")) {
        females++;
      }
      
      // Extract year from DOB and count if born after 2003
      // Assuming DOB format like "1990-05-15" or "15/05/1990"
      String yearStr = "";
      
      // Try to find a 4-digit year in the string
      for (int j = 0; j < dob.length() - 3; j++) {
        String possibleYear = dob.substring(j, j+4);
        if (possibleYear.matches("[0-9]{4}")) {
          yearStr = possibleYear;
          break;
        }
      }
      
      if (yearStr.length() == 4) {
        int year = int(yearStr);
        if (year > 2003) {
          bornAfter2003++;
        }
      }
    }
  }
  
  // Display results
  println("Males: " + males);
  println("Females: " + females);
  println("People born after 2003: " + bornAfter2003);
}

*/

/* Hello Sir Hadziq. This particular question has been very difficult for me to solve, and up till now I have not been able to solve it. If you can, when you mark it, could you help provide a sample code and explain what was the problem with my code. Thank you sir
