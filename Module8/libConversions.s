.global miles2kilometer
.global kph
.global CToF
.global InchesToFt

.text
miles2kilometer:
	SUB sp, sp, #4
	STR lr, [sp, #0]
	
	MOV r1, #161
	MUL r0, r0, r1
	MOV r1, #100
	BL __aeabi_idiv

	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

.data

#End miles2kilometer

.text
kph:
	SUB sp, sp, #4
	STR lr, [sp, #0]

	LDR r0, =kphPrompt1
	BL printf

	LDR r0, =input
	LDR r1, =num
	BL scanf

	LDR r0, =num
	LDR r4, [r0]

	LDR r0, =kphPrompt2
	BL printf

	LDR r0, =input
	LDR r1, =num
	BL scanf
	LDR r7, =num
	LDR r7, [r7]

	MOV r0, r4
	BL miles2kilometer

	MOV r1, r7
	BL __aeabi_idiv

	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr
.data
	kphPrompt1: .asciz "Please enter a number of miles:\n"
	kphPrompt2: .asciz "Please enter a number of hours:\n"
	input: .asciz "%d"
	num: .word 0	

#End kph

.text
CToF:
	SUB sp, sp, #4
	STR lr, [sp, #0]

	MOV r1, #9
	MUL r0, r0, r1
	MOV r1, #5
	BL __aeabi_idiv
	ADD r0, r0, #32

	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr
.data

#End CToF

.text
InchesToFt:
	SUB sp, sp, #4
	STR lr, [sp, #0]

	MOV r1, #12
	BL __aeabi_idiv
	MOV r4, r0

	MUL r0, r1, r4

	SUB r1, r1, r0
	
	MOV r0, r4

	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr
.data

#End InchesToFt
