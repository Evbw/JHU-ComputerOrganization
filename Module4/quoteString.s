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
	BL scanf

	LDR r0, =output
	LDR r0, [r0, #0]
	BL printf

	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

.data
	prompt: .asciz "Enter a string so I can put quotes around it\n"
	input: .asciz "%s"
	output: .asciz "%s"	
