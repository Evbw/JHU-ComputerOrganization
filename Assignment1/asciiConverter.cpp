#include <iostream>
#include <string>
using namespace std;

/*  ----------------------------------------------------------
    Function: asciiConverter
    Description: Reads input from a passed integer value, modulo.
    Parameters:
        - str (string): The input value.
    ----------------------------------------------------------
*/

void asciiConverter(string str) {

    for ( int i = 0; i < str.length(); i++ ) {              //Iterate through the characters in the string and cast the character to int and print
        cout<<int(str[i])<<" ";
    }

}

/*  ----------------------------------------------------------
    Function: main
    Description: Entry point for the program. Handles input, calls converter function.
    ----------------------------------------------------------
*/

int main() {
    string line;                                            //Declare input variable

    cout<<"Hello! Please enter a string to see the ASCII values of the characters:"<<endl;  //Request input
    getline(cin, line);

    asciiConverter(line);
    return 0;
}