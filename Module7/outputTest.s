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
	MOV r5, r0

	LDR r0, =prompt2
	BL printf

	LDR r0, =input
	LDR r1, =num2
	BL scanf

	LDR r0, =num2
	LDR r0, [r0]
	MOV r6, r0

	MOV r7, r5

	StartLoop:
		CMP r0, r6
		BGE EndLoop

		MUL r7, r7, r5
		SUB r6, r6, #1		

		B StartLoop
	EndLoop:

	MOV r1, r7

	LDR r0, =output
	BL printf

	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

.data
	prompt1: .asciz "Please enter a number:\n"
	prompt2: .asciz "Enter a second number:\n"
	input: .asciz "%d"
	num1: .word 0
	num2: .word 0
	output: .asciz "The result is %d\n"
