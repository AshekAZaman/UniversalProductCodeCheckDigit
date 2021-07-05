import javax.swing.JOptionPane;

/*
* ABOUT: The Universal Product Code (UPC) is used to track unique products in stores and is used in
* many countries around the word. You have likely seen UPCs represented as barcodes.
* There are many features and types of UPCs, but we will focus on the UPC-A code and its check
* digit. If you’re interested in learning more: https://en.wikipedia.org/wiki/Universal_Product_Code
*
*/

/* ------------------------------------------ CONSTANTS ----------------------------------------- */

final String AUTHOR = "Kathryn Marcynuk"; // Write your name here.

/* ------------------------------------------ VARIABLES ----------------------------------------- */
String userInput = "";
String printMessage = "";

void programInterface() {
    
    /*
    *
    * OBJECTIVE programInterface()
    * This function sets up the interface and asks the user
    * to make suitable choices.
    * The user will pick from a menu with the following three options:
    *    • Create UPC-A code
    *    • Verify UPC-A code
    *    • Quit
    * The program will then prompt the user for a 11-digit or 12-digit number, depending on the above
    * option chosen. 
    *
    * It will keep prompting the user for a new choice and number until the user enters “quit”.
    */    
    
    boolean endProgram = false;
    
    while(endProgram == false) {
        resetUserInput();
        userInput = JOptionPane.showInputDialog("Please type from the follwing options:\n• create - to make UPC-A code\n• verify - to verify UPC-A code \n• quit - to end the program\n");
        if (userInput.toUpperCase().contains("CREATE")) {
            calculateCheckDigit();
        } else if (userInput.toUpperCase().contains("VERIFY")) {
            verifyCode();            
        } else if (userInput.toUpperCase().contains("QUIT")) {
            printMessage += "Programmed by: " + AUTHOR + "\n" + "" + hour() + ":" + minute() + ":" + second() + "    " + day() + "/" + month() + "/" + year() + "\n";
            endProgram = true;
        } //else if      
    } //while
    
    printMessage();
    
    
} //programInterface

void verifyCode() {
    
    /*
    * OBJECTIVE verifyCode()
    * This function uses JOptionPane to prompt the user to enter a twele digit number. The user input all 11
    * digits at once, it does not have a separate dialog box for each digit. It then checks if the
    * number is a valid 12-digit UPC-A code
    *
    */
    
    resetUserInput();
    
    userInput = JOptionPane.showInputDialog("Please enter the 12 digits of a UPC-A code");
    
    printMessage += "You have entered " + userInput + " to verify\n";
    
    //  Step:1 Sum all digits in odd-numbered positions (first, third, fifth,.. , eleventh).
    
    int sumOddPostions = 0;
    
    for (int i = 0; i < userInput.length() - 1; i += 2) {
        sumOddPostions += Integer.parseInt("" + userInput.charAt(i));    
    } //for
    
    //  Step : 2 Separately sum all digits in even - numbered positions(second, fourth, …, tenth).
    
    int sumEvenPostions = 0;
    
    for (int i = 1; i < userInput.length() - 1; i += 2) {
        sumEvenPostions += Integer.parseInt("" + userInput.charAt(i));
    } //for
    
    // Step : 3 Multiply the sum from Step 1 by 3, and add the result to the sum in Step 2.
    
    int processResult = (sumOddPostions * 3) + sumEvenPostions;
    
    //  Step : 4 Calculate the result(from Step 3) modulo 10.
    
    int finalResult = processResult % 10;
    
    if (finalResult == Integer.parseInt("" + userInput.charAt(userInput.length() - 1))) {
        printMessage += "The 12-digit UPC-A code you entered is valid.\n";
    } else{
        printMessage += "The 12-digit UPC-A code you entered is invalid.\n";
        int checkDigit = 0;
        
        if (finalResult == 0) {    
            checkDigit = 0;
        } else{
            checkDigit = 10 - finalResult;
        } //else
        
        printMessage += "The valid 12-digit UPC-A code is: " + userInput + "" + checkDigit + "\n";  
        
    } //else    
    
} //verifyCode


void resetUserInput() {
    
    /*
    * OBJECTIVE resetUserInput() nice
    * Resetsthe variable userInput for further use
    *
    */
    
    userInput = "";
    
} //resetUserInput

void calculateCheckDigit() {
    
    /*
    * OBJECTIVE calculateCheckDigit()
    * This function uses JOptionPane to prompt the user to enter a eleven digit number. The user input all 11
    * digits at once, it does not have a separate dialog box for each digit. It makes a 12-digit UPC-A code
    *
    */
    
    resetUserInput();
    
    userInput = JOptionPane.showInputDialog("Please enter the first 11 digits of a UPC-A code");    
    
    printMessage += "You have entered " + userInput + " to create a 12 digit UPC-A code\n";
    
    //  Step:1 Sum all digits in odd-numbered positions (first, third, fifth,.. , eleventh).
    
    int sumOddPostions = 0;
    
    for (int i = 0; i < userInput.length(); i += 2) {
        sumOddPostions += Integer.parseInt("" + userInput.charAt(i));    
    } //for
    
    //  Step : 2 Separately sum all digits in even - numbered positions(second, fourth, …, tenth).
    
    int sumEvenPostions = 0;
    
    for (int i = 1; i < userInput.length(); i += 2) {
        sumEvenPostions += Integer.parseInt("" + userInput.charAt(i));
    } //for
    
    // Step : 3 Multiply the sum from Step 1 by 3, and add the result to the sum in Step 2.
    
    int processResult = (sumOddPostions * 3) + sumEvenPostions;
    
    //  Step : 4Calculate the result(from Step 3) modulo 10.
    
    int finalResult = processResult % 10;
    
    // Step : 5 Ifthe result(from Step 4) is zero then the check digit is 0, otherwise the check digit is 10
    // minus theresult.
    
    int checkDigit = 0;
    
    if (finalResult == 0) {    
        checkDigit = 0;
    } else{
        checkDigit = 10 - finalResult;
    }
    
    printMessage += "The 12-digit UPC-A code is: " + userInput + "" + checkDigit + "\n";    
    
} // calculateCheckDigit

void printMessage() {
    
    /*
    * OBJECTIVE printMessage()
    * This function prints the message in the canvas in the center
    *
    */
    
    fill(50);
    textSize(15);
    textAlign(LEFT);
    text(printMessage, 0, height / 8);    
    
} //printMessage()

void setup() {
    
    /*
    * OBJECTIVE setup()
    * This function sets up the canvas. 
    *
    */
    
    size(500,500);
    programInterface();
    
} //setup

void draw() {
    
} //draw