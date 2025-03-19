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
	MOV r2, #'A'
	SUBS r0, r1, r2
	BMI False
		
	MOV r2, #'Z'
	SUBS r0, r1, r2
	BLE True

	MOV r2, #'a'
	SUBS r0, r1, r2
	BMI False
		
	MOV r2, #'z'
	SUBS r0, r1, r2
	BLE True

	B False

	True:
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
