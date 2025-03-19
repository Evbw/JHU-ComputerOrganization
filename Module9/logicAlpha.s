.text
.global main

main:
	SUB sp, sp, #4
	STR lr, [sp]

	LDR r0, =prompt
	BL printf

	LDR r0, =input
	LDR r1, =char
	BL scanf

	LDR r1, =char
	LDR r1, [r1]
	MOV r2, #0
	CMP r1, #0x41
	ADDGE r2, #1

	MOV r3, #0
	CMP r1, #0x5A
	ADDLE r3, #1

	AND r2, r2, r3
	
	MOV r0, #0
	CMP r1, #0x61
	ADDGE r0, #1
	
	MOV r3, #0
	CMP r1, #0x7A
	ADDLE r3, #1
	
	AND r3, r3, r0
	ORR r2, r2, r3

	CMP r2, #1
	BLT False
		LDR r0, =TrueOutput
		BL printf
		B EndProgram

	False:
		LDR r0, =FalseOutput
		BL printf

	EndProgram:

	LDR lr, [sp]
	ADD sp, sp, #4
	MOV pc, lr

.data
	prompt: .asciz "Please enter a single character and I'll see if it's alphabetic or not:\n"
	input: .asciz "%c"
	TrueOutput: .asciz "Yeah, %c is a letter alright.\n"
	FalseOutput: .asciz "Naw, %c isn't a letter.\n"
	char: .word 0
