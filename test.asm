.data
Ask_Input:. asciiz "\Please Enter a String\n"
.text
main:
	addi $t0, $zero, 02837763   # int $t0 = 02837763
	addi $t1, $zero, 11			# int $t1 = 11
	div $t0, $t1 				# divide t0/t1
	mfhi $t3					# remainder = t3
	addi $s0, $t3, 26 			# N = s0
	subi $s1, $s0, 10 			# M = s1
	Syscall