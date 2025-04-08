.text
.global main

main:
	SUB sp, sp, #12
	STR lr, [sp, #0]
	STR r5, [sp, #4]
	STR r6, [sp, #8]

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
		MOVEQ r1, #0
		BEQ Answer

		CMP r4, #1
		BEQ Answer

		MOV r1, #1
		MOV r6, r4
		BL Fibo
		MOV r1, r0

	Answer:

		LDR r0, =output
		BL printf
		B End

	Invalid:
	
		LDR r0, =invalidPrompt
		BL printf
		B UserInput

	End:

	LDR lr, [sp, #0]
	LDR r5, [sp, #4]
	LDR r6, [sp, #8]
	ADD sp, sp, #12
	MOV pc, lr

.data
	prompt: .asciz "Please enter a positive number (greater than 0) to find the value of the Fibonacci sequence at that point:\n"
	invalidPrompt: .asciz "That was less than 1! Try again please from the beginning.\n"
	output: .asciz "The result is %d.\n"
	input: .asciz "%d"
	num: .word 0

.text
Fibo:
	SUB sp, sp, #12
	STR lr, [sp]
	STR r4, [sp, #4]
	STR r5, [sp, #8]

	CMP r4, #1
	BLE Return

	ADD r4, r4, #-1
	BL Fibo
	MOV r5, r0

	MOV r4, r6
	ADD r4, r4, #-2
	BL Fibo
	ADD r0, r0, r5

	Return:
	
	LDR lr, [sp]
	LDR r4, [sp, #4]
	LDR r5, [sp, #8]
	ADD sp, sp, #12
	MOV pc, lr

.data
