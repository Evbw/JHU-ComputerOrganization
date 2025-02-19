#
#
#
.text
.global main

main:
	SUB sp, sp, #4
	STR lr, [sp, #0]

	LDR r0, =prompt
	BL printf

	LDR r0, =input
	LDR r1, =degrees
	BL scanf

	LDR r0, =degrees
	LDR r0, [r0]
	SUB r1, r0, #-32
	MOV r2, #5
	MUL r1, r1, r2
	MOV r2, #9
	BL __aeabi_idiv
	MOV r3, r1

	MOV r2, r1
	LDR r0, =output
	BL printf

	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

.data
	prompt: .asciz "Enter a number in degrees Fahrenheit to convert to Celsius:\n"
	input: .asciz "%d"
	degrees: .word 0
	output: .asciz "%d Fahrenheit is about %d Celcius\n"
