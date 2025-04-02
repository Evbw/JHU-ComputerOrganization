.text
.global main
main:
	SUB sp, sp, #24
	STR lr, [sp, #0]
	STR r5, [sp, #4]
	STR r6, [sp, #8]
	STR r7, [sp, #12]
	STR r8, [sp, #16]
	STR r9, [sp, #20]

	LDR r0, =prompt
	BL printf

	InputLoop:

		LDR r0, =input
		LDR r1, =num
		BL scanf

		LDR r5, =num
		LDR r5, [r5]
		CMP r5, #0
		BGT Cont

		LDR r0, =negativePrompt
		BL printf
		B InputLoop

	Cont:

	MOV r6, #0
	MOV r7, r5
	MOV r9, r7

	MOV r0, r5
	MOV r1, #2
	BL __aeabi_idiv
	MOV r1, r0
	MOV r8, #0

	GuessLoop:
		MOV r5, r0
		LDR r0, =guessOutput
		BL printf
		
		ADD r8, r8, #1

		NarrowLoop:

			LDR r0, =guessInput
			LDR r1, =guessChar
			BL scanf

			LDR r4, =guessChar
			LDR r4, [r4]
			CMP r4, #121
			BEQ Correct
			CMP r4, #89
			BEQ Correct
			CMP r4, #104
			BEQ Higher
			CMP r4, #72
			BEQ Higher
			CMP r4, #108
			BEQ Lower
			CMP r4, #76
			BEQ Lower
			LDR r0, =narrowPrompt
			BL printf
			B NarrowLoop
		
	Higher:
		MOV r6, r5	
		ADD r0, r5, r7
		MOV r1, #2
		BL __aeabi_idiv
		CMP r0, #0
		ADDEQ r0, r0, #1
		CMP r0, r7
		BEQ GreaterThan
		MOV r3, r7
		SUB r3, r3, #1
		CMP r0, r3
		ADDEQ r0, r0, #1
		MOV r1, r0
		B GuessLoop

	Lower:
		MOV r7, r5
		ADD r0, r5, r6
		MOV r1, #2
		BL __aeabi_idiv
		CMP r0, r9
		SUBEQ r0, r0, #1
		CMP r0, r6
		BEQ LessThan
		MOV r3, r6
		ADD r3, r3, #1
		CMP r0, r3
		SUBEQ r0, r0, #1
		MOV r1, r0
		B GuessLoop

	GreaterThan:
		MOV r3, r0
		MOV r1, r7
		LDR r0, =greaterLie
		BL printf
		LDR r0, =guessInput
		LDR r1, =guessChar
		BL scanf

		LDR r4, =guessChar
		LDR r4, [r4]
		CMP r4, #121
		BEQ Incorrect
		CMP r4, #89
		BEQ Incorrect
		CMP r4, #110
		MOVEQ r6, #0
		CMP r4, #78
		MOVEQ r6, #0
		B GuessLoop
		
		
	LessThan:
		MOV r3, r0
		MOV r1, r7
		LDR r0, =lesserLie
		BL printf
		LDR r0, =guessInput
		LDR r1, =guessChar
		BL scanf

		LDR r4, =guessChar
		LDR r4, [r4]
		CMP r4, #121
		BEQ Incorrect
		CMP r4, #89
		BEQ Incorrect
		CMP r4, #104
		MOVEQ r7, r9
		CMP r4, #78
		MOVEQ r7, r9
		B GuessLoop

	Incorrect:
		LDR r0, =incorrectOutput
		BL printf
		B End

	Correct:
		MOV r1, r8
		CMP r1, #1
		BEQ SingleGuess
		LDR r0, =correctOutput	//Produce output for a correct guess
		BL printf
		B End

	SingleGuess:	
		LDR r0, =singleGuessOutput	//Produce output for a correct guess
		BL printf

	End:

	LDR lr, [sp, #0]
	LDR r5, [sp, #4]
	LDR r6, [sp, #8]
	LDR r7, [sp, #12]
	LDR r8, [sp, #16]
	LDR r9, [sp, #20]
	ADD sp, sp, #24
	MOV pc, lr

.data
	debug: .asciz "%d"
	prompt: .asciz "Welcome to the amazing Guess-o-Tron, where I try to guess a number between 0 and a number you selected. Please enter a maximum value:\n"
	negativePrompt: .asciz "The number has to be greater than 0!\n"
	narrowPrompt: .asciz "Invalid input. Please try again!\n"
	greaterLie: .asciz "Is the number greater than %d? Enter y or n:\n"
	lesserLie: .asciz "Is the number less than %d? Enter y or n:\n"
	guessOutput: .asciz "Is your number %d? Type y for yes, h if the number is higher, or l if the number is lower.\n"
	correctOutput: .asciz "Ladies and gentlemen: We got'em in %d guesses.\n"
	incorrectOutput: .asciz "Then I have no idea! You stumped me.\n"
	singleGuessOutput: .asciz "Ladies and gentlemen: We got'em in a single guess.\n"
	guessInput: .asciz " %c"
	input: .asciz "%d"
	num: .word 0
	guessChar: .word 2
