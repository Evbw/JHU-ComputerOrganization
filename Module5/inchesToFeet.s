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
	MOV r1, #12
	BL __aeabi_idiv
	MOV r4, r0		//Feet in r4

	MOV r1, #12
	MOV r0, r4
	MUL r0, r1, r4

	LDR r1, =num
	LDR r1, [r1]
	SUB r1, r1, r0

	MOV r2, r1
	MOV r1, r4
	
	LDR r0, =output
	BL printf

	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

.data
	prompt: .asciz "Please enter the number of inches you'd like to convert to feet:\n"
	input: .asciz "%d"
	num: .word 0
	output: .asciz "The number of feet is %d with %d inches left over\n"
