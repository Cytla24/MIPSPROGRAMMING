# MIPS Programming Project 1 
# Aimie Ojuba - @02837763
.data

Ask_Input: .asciiz "Please Enter a String\n"

.text

main:
	lui $t8, 43
	ori $t8, $t8, 19715
	add $t0, $zero, $t8				# int $t0 = 02837763
	addi $t1, $zero, 11				# int $t1 = 11
	div $t0, $t1					# divide t0/t1
	mfhi $t3						# remainder = t3
	addi $s0, $t3, 26				# N = s0
	addi $t9, $zero, 10
	sub $s1, $s0, $t9				# M = s1


	#display req for input
	li $v0, 4
	la $a0, Ask_Input
	syscall
	
	#End of Main
	li $v0,10
	syscall



