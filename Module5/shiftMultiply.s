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
	MOV r1, r0
	LSL r1, r1, #3
	LSL r0, r0, #1
	ADD r1, r1, r0

	LDR r0, =output
	BL printf
	
	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

.data
	prompt: .asciz "Enter a number and witness the magic of it being multiplied by 10\n"
	input: .asciz "%d"
	num: .word 0
	output: .asciz "That number multiplied by 10 is %d\n"
