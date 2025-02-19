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

	LDR r0, =input1
	LDR r2, =num1
	BL scanf

	LDR r1, =input2
	LDR r3, =num2
	BL scanf

	LDR r0, =output
	BL printf

	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

.data
	prompt: .asciz "Please enter a number of feet and inches to convert them to feet (and inches):\n"
	input1: .asciz "%d"
	input2: .asciz "%d"
	num1: .word 0
	num2: .word 0
	output: .asciz "The first number was %d and the second number was %d\n"


