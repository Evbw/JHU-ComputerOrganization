#
#
#
.text
.global main

main:
	SUB sp, sp, #4
	STR lr, [sp, #0]

	LDR r0, =prompt
	BL printf

	LDR r0, =input
	LDR r1, =degrees
	BL scanf

	LDR r0, =degrees
	LDR r0, [r0]
	MOV r5, r0		//Store original value in r5
	MOV r1, #9
	MUL r0, r0, r1		//Multiply by 9
	MOV r1, #5
	BL __aeabi_idiv		//Divide by 5
	ADD r0, r0, #32		//Final conversion

	MOV r2, r0		//Store converted value in r2
	MOV r1, r5		//Restore original value to r1
	LDR r0, =output
	BL printf

	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

.data
	prompt: .asciz "Enter a number in degrees Celsius to convert to Fahrenheit:\n"
	input: .asciz "%d"
	degrees: .word 0
	output: .asciz "%d Celsius is about %d Fahrenheit\n"
