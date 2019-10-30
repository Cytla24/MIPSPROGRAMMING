# MIPS Programming Project 1 
# Aimie Ojuba - @02837763
.data

Ask_Input:.asciiz "\Please Enter a String\n"

.text

main:
	addi $t0, $zero, 02837763
	addi $t1, $zero, 11
	div $t0, $t1
	mfhi $t3
	addi $s0, $t3, 26
	addi $t9, $zero, 10
	sub $s1, $s0, $t9

