.text
.global main
main:
	SUB sp, sp, #16
	STR lr, [sp, #0]
	STR r5, [sp, #4]
	STR r6, [sp, #8]
	STR r7, [sp, #12]

	LDR r0, =prompt
	BL printf

	UserInput:

		LDR r0, =input
		LDR r1, =num
		BL scanf

		LDR r5, =num
		LDR r5, [r5]

		CMP r5, #3
		BGT Step2		//Handle an instance when the input is less than the required value
		
		LDR r0, =invalidPrompt
		BL printf
		B UserInput

	Step2:

	MOV r0, r5			//Divide by 2 for easy comparison of divisors
	MOV r1, #2
	BL __aeabi_idiv
	MOV r6, r0			//Move the resulting value into r6

	MUL r0, r6, r1
	CMP r0, r5
	BEQ NotPrime
	MOV r4, #0
	MOV r4, r6

	CheckDivisor:
		MOV r0, r5
		MOV r1, r4
		BL __aeabi_idiv

		MOV r2, r0
		MUL r2, r2, r4
		SUB r2, r5, r2
		CMP r2, #0
		BEQ NotPrime

		ADD r4, r4, #-1
		CMP r4, #1
		BEQ Prime
		B CheckDivisor		

	Prime:
		MOV r1, r5
		LDR r0, =primePrompt	//Produce error output
		BL printf
		B End

	NotPrime:
		LDR r0, =notPrimePrompt	//Display prompt if it's not prime
		BL printf

	End:

	LDR lr, [sp, #0]
	LDR r5, [sp, #4]
	LDR r6, [sp, #8]
	LDR r7, [sp, #12]
	ADD sp, sp, #16
	MOV pc, lr

.data
	debug: .asciz "%d\n"
	prompt: .asciz "Please enter a number greater than 3 and I'll see if it's prime:\n"
	invalidPrompt: .asciz "Come on, man, be serious. The number has to be greater than 3.\n"
	primePrompt: .asciz "Yup, %d is prime.\n"
	notPrimePrompt: .asciz "Naw, that's not prime.\n"
	input: .asciz "%d"
	num: .word 0
