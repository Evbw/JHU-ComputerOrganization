.text
.global main

main:
	SUB sp, sp, #8
	STR lr, [sp, #0]
	STR r4, [sp, #4]

	LDR r0, =prompt
	BL printf

	UserInput:

		LDR r0, =input
		LDR r1, =num
		BL scanf

		LDR r4, =num
		LDR r4, [r4]

		MOV r0, #0
		MOV r1, #1

		CMP r4, #0
		BLT Invalid		//Handle an instance when the input is less than the required value

		MOV r0, r4
		BL Fibo
		MOV r1, r0

		LDR r0, =output
		BL printf
		B End

	Invalid:
	
		LDR r0, =invalidPrompt
		BL printf
		B UserInput

	End:

	LDR lr, [sp, #0]
	LDR r4, [sp, #4]
	ADD sp, sp, #8
	MOV pc, lr

.data
	prompt: .asciz "Please enter a positive number (greater than 0) to find the value of the Fibonacci sequence at that point:\n"
	invalidPrompt: .asciz "That was less than 1! Try again please from the beginning.\n"
	output: .asciz "The result is %d.\n"
	input: .asciz "%d"
	num: .word 0

.text

Fibo:
	SUB sp, sp, #8
	STR lr, [sp]
	STR r1, [sp, #4]

	CMP r0, #2
	BLE BaseCase

	MOV r1, r0

	ADD r0, r0, #-1
	BL Fibo
	MOV r2, r0

	MOV r0, r1
	ADD r0, r0, #-2
	BL Fibo
	ADD r0, r0, r2

	B Return

	BaseCase:
		MOV r0, #1

	Return:
	
	LDR lr, [sp]
	LDR r1, [sp, #4]
	ADD sp, sp, #8
	MOV pc, lr

.data
