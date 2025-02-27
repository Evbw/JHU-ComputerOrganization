.text
.global main

main:
	SUB sp, sp, #4
	STR lr, [sp, #0]

	MOV r0, #0b1001
	ROR r0, r0, #20
	MOV r1, r0
	LDR r0, =output
	BL printf

	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

.data
	output: .asciz "The number after rotating is %d\n"
