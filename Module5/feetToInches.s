#
#
#
.text
.global main

main:
	SUB sp, sp, #4
	STR lr, [sp, #0]

	LDR r0, =prompt1
	BL printf

	LDR r0, =input
	LDR r1, =num1
	BL scanf

	LDR r0, =prompt2
	BL printf

	LDR r0, =input
	LDR r1, =num2
	BL scanf

	LDR r1, =num1
	LDR r1, [r1]
	LDR r2, =num2
	LDR r2, [r2]

	LDR r0, =output
	BL printf

	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

.data
	prompt1: .asciz "Please enter a number of feet to convert them to feet (and leftover inches):\n"
	prompt2: .asciz "If you have any additional inches, add them here:\n"
	input: .asciz "%d"
	num1: .word 0
	num2: .word 0
	output: .asciz "The first number was %d and the second number was %d\n"


