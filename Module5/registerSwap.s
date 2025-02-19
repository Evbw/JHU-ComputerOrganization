#
#
#
.text
.global main

main:
	SUB sp, sp, #4
	STR sp, [sp, #0]

	LDR sp, [sp, #0]
	ADD sp, sp #4
	MOV pc, lr

.data
