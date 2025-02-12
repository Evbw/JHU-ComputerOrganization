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
	LDR r1, =sentence
	BL scanf

	LDR r0, =output
	LDR r1, =sentence
	BL printf

	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

.data
	prompt: .asciz "Enter a sentence so I can put quotes around it\n"
	input: .asciz "%s"
	output: .asciz "You typed the following: \"%s\"\n"
	sentence: .space 99
