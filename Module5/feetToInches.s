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

	LDR r0, =num1
	LDR r0, [r0]
	MOV r1, #12
	MUL r0, r0, r1
	MOV r5, r0		//Total inches so far in r5

	LDR r0, =prompt2
	BL printf

	LDR r0, =input
	LDR r1, =num2
	BL scanf

	LDR r0, =num2
	LDR r0, [r0]
	ADD r1, r0, r5

	LDR r0, =output
	BL printf

	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

.data
	prompt1: .asciz "Please enter a number of feet to convert them to inches:\n"
	prompt2: .asciz "If you have any additional inches, add them here:\n"
	input: .asciz "%d"
	num1: .word 0
	num2: .word 0
	output: .asciz "The total number of inches is %d\n"


