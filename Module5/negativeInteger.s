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

	LDR r0, =num
	LDR r0, [r0]
	MVN r1, r0
	MOV r2, #1
	ADD r1, r1, r2

	LDR r0, =output
	BL printf

	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

.data
	prompt: .asciz "Please enter an integer\n"
	input: .asciz "%d"
	num: .word 0
	output: .asciz "The negative of that integer is %d\n"
