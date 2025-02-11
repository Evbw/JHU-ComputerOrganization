#
#
#
.text
	SUB sp, sp, #4
	STR lr, [sp, #0]

	LDR r0, =prompt1
	BL printf

	LDR r0, =format1
	LDR r1, =num1
	BL scanf

	LDR r0, =output1
	LDR r1, =num1
	LDR r1, [r1, #0]
	BL printf

	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

.data
	prompt1: .asciz "Please enter your age: "
	format1: .asciz "%d"
	num1:	 .word  0
	output1: .asciz "Your age is %d\n"
