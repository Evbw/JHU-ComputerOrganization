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

	BL miles2kilometer
	BL __aeabi_idiv

	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr
.data

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
InchestToFt:
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
