#
# Program name: finalLoop
# Author: Me
# Date: 2025-05-04
# Purpose: Allow the user to enter a number of integers, total them, average them, and display that information
#


.text
.global main

	// Register dictionary
	// r4 - counter
	// r5 - total
	// r3 - average


main:
	SUB sp, sp #4		
	STR lr, [sp, #0]

	MOV r4, #0		//Clear registers to assure accurate information
	MOV r5, #0
	MOV r6, #0

	LDR r0, =prompt		//Request user input
	BL printf

	Loop:
		LDR r0, =input	//And accept it inside the loop.
		LDR r1, =num
		BL scanf

		LDR r0, =num	//Load the value into r0
		LDR r0, [r0]

		CMP r0, #-1	//If the entered value is -1, end the program.
		BEQ EndProgram

		ADD r4, r4, #1	//Increase the counter.
		ADD r5, r5, r0	//And add to the total.
		B Loop		//Go back to the top of the loop.

	EndProgram:
		MOV r0, r5
		MOV r1, r3
		BL __aeabi_idiv
		MOV r3, r0
		MOV r1, r4
		MOV r2, r5		

	LDR r0, =output
	BL printf		

	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

.data
	prompt: .asciz "Hello! Please enter a number, hit enter, and enter another number. The loop will end when you enter -1:\n"
	input: .asciz "%d"
	num: .word 0
	output: .asciz "%d numbers enter for a total of %d and an average of %d. Good job!\n"
