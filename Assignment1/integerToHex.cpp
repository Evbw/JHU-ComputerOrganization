#include <iostream>
#include <vector>
using namespace std;

int ARRSIZE = 16;                               //Declare a constant of size 16 for the hex array.

/*  ----------------------------------------------------------
    Function: hexConverter
    Description: Reads input from a passed integer value, modulos the value by the hex value, and pushes the value to output vector for display.
    Parameters:
        - x (int): The input value.
        - digit (int): A value to determine the index of the array for the appropriate hex value
        - arr (char): An array of characters to represent hex values
        - output (char): A vector to accept characters as they're determined.
    ----------------------------------------------------------
*/

void hexConverter(int x) {
    char arr[ARRSIZE] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};   //Declare array and variables
    int digit;
    vector<char> output;

    while ( x > 0 ) {                                   //While x still has digits available, determine what those digits are and push them to the output vector
        digit = x % ARRSIZE;
        output.push_back(arr[digit]);
        x = x / ARRSIZE;
    }

    for ( int i = output.size() - 1; i >= 0; i-- ) {    //Print the output vector in reverse order
        cout<<output[i];
    }

}

/*  ----------------------------------------------------------
    Function: main
    Description: Entry point for the program. Handles input, calls converter function.
    ----------------------------------------------------------
*/

int main() {
    int x;                                              //Declare input variable

    cout<<"Hello! Please enter an integer to see the hex value: (Note that letters will cause the program to fail)"<<endl;      //Request input
    cin>>x;

    hexConverter(x);                                    //Call the converter function!
    return 0;
}