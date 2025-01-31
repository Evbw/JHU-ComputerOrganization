#include <iostream>
#include <string>
using namespace std;

/*  ----------------------------------------------------------
    Function: hexConverter
    Description: Reads input from a passed string, divides it into groups of four, and creates the output string .
    Parameters:
        - str (string): The input string.
    Returns:
        - hexString (string): Pointer to the array containing the numbers.
    ----------------------------------------------------------
*/

string hexConverter(string str) {
    string hexString;                                       //Declare variables for output and building the translatable blocks of the binary string
    string binaryExpression;                                
    int digitCount = 0;
    int printChecker = 0;                                   //Arbitrary variable to prevent the printing of 0 as the first character.

    if (str.length() % 4 != 0) {                            //Add padding if the binary number is too short
        int padLength = 4 - (str.length() %4);
        string padding(padLength, '0');
        str = padding + str;
    }

    for ( int i = 0; i <= str.length(); i++ ) {

        binaryExpression = binaryExpression + str[i];       //Build characters onto the binaryExpression for conversion
        digitCount++;                                       //Check number of digits to confirm proper size

        if ( digitCount == 4 ) {
            int binaryNumber = stoi(binaryExpression);      //From the four character input, choose the appropriate hex value and add it to the output string.
            switch (binaryNumber) {
                case 0000:
                    if (printChecker != 0) {
                        hexString += "0";
                    }                    
                    digitCount = 0;
                    binaryExpression.clear();
                    break;
                case 1:
                    hexString += "1";
                    digitCount = 0;
                    binaryExpression.clear();
                    printChecker++;
                    break;
                case 10:
                    hexString += "2";
                    digitCount = 0;
                    binaryExpression.clear();
                    printChecker++;
                    break;
                case 11:
                    hexString += "3";
                    digitCount = 0;
                    binaryExpression.clear();
                    printChecker++;
                    break;
                case 100:
                    hexString += "4";
                    digitCount = 0;
                    binaryExpression.clear();
                    printChecker++;
                    break;
                case 101:
                    hexString += "5";
                    digitCount = 0;
                    binaryExpression.clear();
                    printChecker++;
                    break;
                case 110:
                    hexString += "6";
                    digitCount = 0;
                    binaryExpression.clear();
                    printChecker++;
                    break;
                case 111:
                    hexString += "7";
                    digitCount = 0;
                    binaryExpression.clear();
                    printChecker++;
                    break;
                case 1000:
                    hexString += "8";
                    digitCount = 0;
                    binaryExpression.clear();
                    printChecker++;
                    break;
                case 1001:
                    hexString += "9";
                    digitCount = 0;
                    binaryExpression.clear();
                    printChecker++;
                    break;
                case 1010:
                    hexString += "A";
                    digitCount = 0;
                    binaryExpression.clear();
                    printChecker++;
                    break;
                case 1011:
                    hexString += "B";
                    digitCount = 0;
                    binaryExpression.clear();
                    printChecker++;
                    break;
                case 1100:
                    hexString += "C";
                    digitCount = 0;
                    binaryExpression.clear();
                    printChecker++;
                    break;
                case 1101:
                    hexString += "D";
                    digitCount = 0;
                    binaryExpression.clear();
                    printChecker++;
                    break;
                case 1110:
                    hexString += "E";
                    digitCount = 0;
                    binaryExpression.clear();
                    printChecker++;
                    break;
                case 1111:
                    hexString += "F";
                    digitCount = 0;
                    binaryExpression.clear();
                    printChecker++;
                    break;
                default:
                    cout<<"Error reading input. Exiting program.";
                    return 0;
                    break;
            }
        }
    }
    return hexString;                                   //Return the value of the hex number as a string.
}

/*  ----------------------------------------------------------
    Function: main
    Description: Entry point for the program. Handles input, calls converter function, and prints output.
    ----------------------------------------------------------
*/

int main() {
    string line;                                        //Declare string to accept user input.

    cout<<"Hello! Please enter a string in binary to see the hex value: (Note that letters will cause the program to fail)"<<endl;
    getline(cin, line);

    cout<<hexConverter(line);
    return 0;
}