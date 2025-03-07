.text
.global main

main:

	SUB sp, sp, #4
	STR lr, [sp, #0]

	LDR r0, =prompt
	BL printf

	LDR r0, =input
	LDR r1, =num1
	BL scanf	

	LDR r1, =num1
	LDR r0, [r1]
	MOV r7, r0

	LDR r0, =prompt2
	BL printf

	LDR r0, =input
	LDR r1, =num2
	BL scanf
	
	LDR r1, =num2
	LDR r6, [r1]
	
	MOV r1, r7
	MOV r2, r6

	LDR r0, =output
	BL printf

	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

data:
	prompt: .asciz "Please enter a number:\n"
	prompt2: .asciz "Now enter an exponent:\n"
	input: .asciz "%d"
	output: .asciz "The result is %d and %d\n"
	num1: .word 0
	num2: .word 0
