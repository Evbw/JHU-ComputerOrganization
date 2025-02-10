.text
.global main

main:
	SUB sp, sp,#4
	STR lr, [sp, #0]

	LDR r0, =prompt
	BL printf

	LDR r0, =input
	LDR r1, =num
	BL scanf

	LDR r0, =format
	LDR r1, =num
	LDR r1, [r1, #0]
	BL printf

	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

   .data
	num: .word 0
	prompt: .asciz "Enter A Number\n"
	input: .asciz "%d"
	format: .asciz "Your number is %d\n"
