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

		LDR r5, =num
		LDR r5, [r5]

		CMP r5, #0
		BLE Invalid		//Handle an instance when the input is less than the required value

		LDR r0, =prompt2
		BL printf
		
		LDR r0, =input
		LDR r1, =num
		BL scanf

		LDR r6, =num
		LDR r6, [r6]
		
		CMP r6, #0
		MOVEQ r0, #0
		BEQ Answer

		CMP r6, #1
		MOVEQ r0, #0
		BEQ Answer

		MOV r0, r5
		MOV r3, r5
		BL Multi
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
	prompt: .asciz "Please enter a positive number (greater than 0):\n"
	prompt2: .asciz "Please enter a second positive number (greater than 0) to multiply:\n"
	invalidPrompt: .asciz "That was less than 1! Try again please from the beginning.\n"
	output: .asciz "The result is %d.\n"
	input: .asciz "%d"
	num: .word 0

.text
Multi:
	SUB sp, sp, #8
	STR lr, [sp]
	STR r6, [sp, #4]

	CMP r6, #1
	BGT Else
		B Return
	Else:
		ADD r0, r0, r3
		ADD r6, r6, #-1
		BL Multi
		B Return

	Return:
	
	LDR lr, [sp]
	LDR r4, [sp, #4]
	ADD sp, sp, #8
	MOV pc, lr

.data
