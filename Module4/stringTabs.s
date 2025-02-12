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

	LDR r0, =num1
	BL scanf

	LDR r0, =output1
	LDR r1, =num1
	LDR r2, =message1
	BL printf

	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

.data
	prompt1: .asciz "Please enter a number:\n"
	num1: .asciz "%d"
	output1: .asciz "The number you chose is\t\n"
	message1: .asciz "\tAnd a tab on this side to verify\n"
