.text
.global main

main:
	SUB sp, sp, #4
	STR lr, [sp]

	LDR r0, =prompt1
	BL printf

	LDR r0, =input
	LDR r1, =num1
	BL scanf
	
	LDR r7, =num1
	LDR r7, [r7]

	LDR r0, =prompt2
	BL printf

	LDR r0, =input
	LDR r1, =num2
	BL scanf

	LDR r8, =num2
	LDR r8, [r8]

	LDR r0, =prompt3
	BL printf

	LDR r0, =input
	LDR r1, =num3
	BL scanf

	LDR r9, =num3
	LDR r9, [r9]

	MOV r0, r7
	MOV r1, r8
	MOV r2, r9

	BL findMaxOf3

	MOV r1, r0

	LDR r0, =output
	BL printf
	
	LDR lr, [sp]
	ADD sp, sp, #4
	MOV pc, lr

.data
	prompt1: .asciz "I will find the maximum of three numbers. Enter the first number:\n"
	prompt2: .asciz "Please enter the second number:\n"
	prompt3: .asciz "Please enter the third number:\n"
	input: .asciz "%d"
	num1: .word 0
	num2: .word 0
	num3: .word 0
	output: .asciz "The largest number is %d.\n"

.text

	findMaxOf3:

	SUB sp, sp, #4
	STR lr, [sp]

	CMP r0, r1
	MOVLT r0, r1
	CMP r0, r2
	MOVLT r0, r2

	LDR lr, [sp]
	ADD sp, sp, #4
	MOV pc, lr


