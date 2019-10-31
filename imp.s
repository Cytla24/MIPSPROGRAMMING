# MIPS Programming Project 1 
# Aimie Ojuba - @02837763
.data

	Ask_Input: .asciiz "Please Enter a String\n"
	input: .space 10

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
	
	#input string
	li $v0, 8
	la $a0, input
	li $a1, 20
	syscall

	#instantiate index to 0
	addi $t6, $zero, 0

loop1:
	beq $t6, 44, exit

	#get each character
	la $a1, input
	addu $a1, $a1, $t6
	lb $a0, 0($a1)

	#Check valididy of char
	#Check if number
	li $t5, 47		
	sgt $s2, $a0, $t5

	li $t5, 58
	slt $s7, $a0, $t5
	
	and $s2, $s2, $s7

	#Check if big  letter
	li $t5, 64		
	sgt $s3, $a0, $t5
	
	li $t5, 0
	addi $t5, $s1, 65		# t5 = s1 + ord(A)
	slt $s4, $a0, $t5
	
	and $s3, $s3, $s4

	#check if small letter
	li $t5, 96
	sgt $s5, $a0, $t5
	
	li $t5, 0
	addi $t5, $s1, 97
	slt $s6, $a0, $t5
	
	and $s5, $s5, $s6

	#verify if any are true
	or $s2, $s2, $s3
	or $s2, $s2, $s5

	li $v0, 11
	

	#increment index
	addi $t6, $t6, 1
	j loop1

exit:

	#End of Main
	li $v0,10
	syscall



