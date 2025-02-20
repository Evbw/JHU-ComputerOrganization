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
	LDR r1, =num
	BL scanf

	LDR r0, =prompt2
	BL printf

	LDR r0, =input
	LDR r1, =num2
	BL scanf

	LDR r0, =num
	LDR r0, [r0]

	LDR r1, =num2
	LDR r1, [r1]

	EOR r0, r0, r1
	EOR r1, r0, r1
	EOR r0, r0, r1

	MOV r2, r1
	MOV r1, r0	

	LDR r0, =output
	BL printf

	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

.data
	prompt: .asciz "Please enter a value to be swapped:\n"
	prompt2: .asciz "And a second value to swap with it:\n"
	input: .asciz "%d"
	num: .word 0
	num2: .word 0
	output: .asciz "The numbers have been changed to 1. %d and 2. %d\n"
