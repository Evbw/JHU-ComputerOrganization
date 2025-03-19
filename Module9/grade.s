.text
.global main

main:
	SUB sp, sp, #4
	STR lr, [sp]

	LDR r0, =namePrompt
	BL printf

	LDR r0, =nameInput
	LDR r1, =name
	BL scanf

	LDR r0, =gradePrompt
	BL printf

	LDR r0, =gradeInput
	LDR r1, =grade
	BL scanf

	LDR r1, =name
	LDR r2, =grade

	LDR r0, =output
	BL printf

	LDR lr, [sp]
	ADD sp, sp, #4
	MOV pc, lr

.data
	namePrompt: .asciz "Please enter the student's name:\n"
	gradePrompt: .asciz "Please enter their grade:\n"
	nameInput: .asciz "%s"
	gradeInput: .asciz "%d"
	name: .space 100
	grade: .word 0
	output: .asciz "%s got a %d\n"
	
