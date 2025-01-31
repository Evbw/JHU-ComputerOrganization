#include <iostream>
#include <string>
using namespace std;

/*  ----------------------------------------------------------
    Function: toUpper
    Description: toUpper will take an input string and convert all letter characters to upper case, then print the string.
    Parameters:
        - str: The input string
    ----------------------------------------------------------
*/

void toUpper(string str) {

    for ( int i = 0 ; i <= str.length() ; i++ ) {       //For loop to go through every character in the string
        
        if ( str[i] >= 'a' && str[i] <= 'z' ) {         //If it is lower case, it is a candidate to be changed to upper case
            str[i] = str[i] & ~0x20;                    //Per the lecture, we turn on the 5th bit using bit masking with the & bit operator
        }
    }
    cout<<str<<endl;                                    //Print the resulting string!
}

/*  ----------------------------------------------------------
    Function: toLower
    Description: toLower will take an input string and convert all letter characters to lower case, then print the string.
    Parameters:
        - str: The input string
    ----------------------------------------------------------
*/

void toLower(string str) {

    for ( int i = 0 ; i <= str.length() ; i++ ) {       //For loop to go through every character in the string 
        
        if ( str[i] >= 'A' && str[i] <= 'Z' ) {         //If it is upper case, it is a candidate to be changed to lower case
            str[i] = str[i] | 0x20;                     //Per the lecture, we turn off the 5th bit using bit masking with the | bit operator
        }
    }
    cout<<str<<endl;                                    //Print the resulting string!
}

/*  ----------------------------------------------------------
    Function: main
    Description: Entry point for the program. Handles user input and directs to the appropriate function.
    ----------------------------------------------------------
*/

int main() {
    string line;                                        //Declare variables for input
    int x;

    cout<<"Hello! Please enter a string to have its case changed:"<<endl;   //Request user input for the string to convert
    getline(cin, line);

    cout<<"Would you like to see that in upper or lower case? (Enter 1 to change to upper case or 2 to change to lower case)"<<endl;   //Request user input for the type of conversion
    cin>>x;
    cout<<endl;
    
    if ( x <= 1 ) {                                     //If the user enters anything lower than 1, then choose toUpper for minor error correction
        toUpper(line);
    }
    else {                                              //Anything else will automatically go toLower
        toLower(line);
    }
    return 0;
}