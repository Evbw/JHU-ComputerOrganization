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
	SUB r0, r0, #32
	MOV r1, #5
	MUL r0, r0, r1
	MOV r1, #9
	BL __aeabi_idiv		//Final conversion

	MOV r2, r0		//Store converted value in R2
	MOV r1, r5		//Restore original value to r1
	LDR r0, =output
	BL printf

	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

.data
	prompt: .asciz "Enter a number in degrees Fahrenheit to convert to Celsius:\n"
	input: .asciz "%d"
	degrees: .word 0
	output: .asciz "%d Fahrenheit is about %d Celsius\n"
