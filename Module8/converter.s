.global main

.text
main:
	SUB sp, sp, #4
	STR lr, [sp, #0]

	LDR r0, =prompt
	BL printf

	LDR r0, =input
	LDR r1, =num
	BL scanf

	LDR r0, =num
	LDR r0, [r0]

	CMP r0, #1
	BLE m2k
	CMP r0, #2
	BEQ kphour
	CMP r0, #3
	BEQ ctf
	CMP r0, #4
	BGE itf

	m2k:
		LDR r0, =m2kPrompt
		BL printf
		
		LDR r0, =input
		LDR r1, =num
		BL scanf

		LDR r0, =num
		LDR r0, [r0]
		BL miles2kilometer
		MOV r1, r0
		
		LDR r0, =m2kOutput
		BL printf
		B EndProgram

	kphour:

		BL kph
		MOV r1, r0
		
		LDR r0, =kphOutput
		BL printf
		
		B EndProgram

	ctf:

		LDR r0, =ctfPrompt
		BL printf
		
		LDR r0, =input
		LDR r1, =num
		BL scanf

		LDR r0, =num
		LDR r0, [r0]
		BL CToF
		MOV r1, r0

		LDR r0, =ctfOutput
		BL printf
		
		B EndProgram

	itf:

		LDR r0, =itfPrompt
		BL printf
		
		LDR r0, =input
		LDR r1, =num
		BL scanf

		LDR r0, =num
		LDR r0, [r0]
		BL InchesToFt
		MOV r1, r0

		LDR r0, =itfOutput
		BL printf
		
		B EndProgram
	
	EndProgram:

	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

.data
	prompt: .asciz "What would you like to do today?\nPlease enter 1 to convert miles to kilometers.\nPlease enter 2 to convert miles to kph.\nPlease enter 3 to convert from Celsius to Fahrenheit.\nPlease enter 4 to convert a number of inches to feet.\n"
	m2kPrompt: .asciz "Please enter a number of miles to convert to kilometers:\n"
	m2kOutput: .asciz "That is %d kilometers.\n"
	kphPrompt1: .asciz "Please a number of miles:\n"
	kphPrompt2: .asciz "Please enter a number of hours:\n"
	kphOutput: .asciz "That is %d kph.\n"
	ctfPrompt: .asciz "Please enter degrees Celsius to convert to Fahrenheit:\n"
	ctfOutput: .asciz "That is %d degrees Fahrenheit.\n"
	itfPrompt: .asciz "Please enter inches to convert to feet:\n"
	itfOutput: .asciz "That is %d feet.\n"
	kpHourTest: .asciz "The second is %d and the first is %d.\n"
	input: .asciz "%d"
	num: .word 0
