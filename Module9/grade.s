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

	LDR r7, =grade
	LDR r7, [r7]

	MOV r1, #0
	MOV r0, #0
	CMP r7, r0
	MOVGE r1, #1

	MOV r2, #0
	MOV r0, #100
	CMP r7, r0
	MOVLE r2, #1

	AND r1, r1, r2
	MOV r2, #1
	CMP r1, r2
	BEQ gradeA

	LDR r0, =Invalid
	BL printf
	B EndProgram

	gradeA:
		MOV r0, #90
		CMP r7, r0
		BLT gradeB

		MOV r2, r7
		LDR r1, =name
		LDR r0, =GradeA
		BL printf
		B EndProgram

	gradeB:
		MOV r0, #90
		CMP r7, r0
		BLT gradeC
	
		MOV r2, r7
		LDR r1, =name
		LDR r0, =GradeB
		BL printf
		B EndProgram

	gradeC:
		MOV r0, #90
		CMP r7, r0
		BLT gradeD

		MOV r2, r7
		LDR r1, =name
		LDR r0, =GradeC
		BL printf
		B EndProgram

	gradeD:
		MOV r0, #90
		CMP r7, r0
		BLT gradeF

		MOV r2, r7
		LDR r1, =name
		LDR r0, =GradeD
		BL printf
		B EndProgram
	gradeF:
		MOV r0, #90
		CMP r7, r0

		MOV r2, r7
		LDR r1, =name
		LDR r0, =GradeF
		BL printf
		B EndProgram

	EndProgram:

	LDR lr, [sp]
	ADD sp, sp, #4
	MOV pc, lr

.data
	namePrompt: .asciz "Please enter the student's name:\n"
	gradePrompt: .asciz "Please enter their grade:\n"
	nameInput: .asciz "%[^\n]"
	gradeInput: .asciz "%d"
	name: .space 100
	grade: .word 0
	GradeA: .asciz "%s got an A.\n"
	GradeB: .asciz "%s got a B.\n"
	GradeC: .asciz "%s got a C.\n"
	GradeD: .asciz "%s got a D.\n"
	GradeF: .asciz "%s got an F.\n"
	Invalid: .asciz "Grade must be between 0 and 100.\n"
	
