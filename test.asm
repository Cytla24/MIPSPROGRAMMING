.data
	message:   .asciiz "\Please Enter a String\n"
	input:     .space 10
	nexx: 	    .asciiz " - "
.text
main:
	addi $t0, $zero, 02837763  		# int $t0 = 02837763
	addi $t1, $zero, 11			# int $t1 = 11
	div $t0, $t1 				# divide t0/t1
	mfhi $t3					# remainder = t3
	addi $s0, $t3, 26 			# N = s0
	addi $t9, $zero, 10
	sub $s1, $s0, $t9			# M = s1
	
	#display req for input
	li $v0, 4
	la $a0, message
	syscall
	
	#input string
	li $v0, 8
	la $a0, input
	li $a1, 20
	syscall
	
	#instantiate index
	addi $t6,$zero,0
	
	
	
loop1:
	beq $t6, 11, exit
	
	#print each character
	la $a1, input
	addu $a1, $a1, $t6
	lb $a0, 0($a1)
	li $v0, 11
	syscall
	
	#print space
	li $v0, 11
	la $a0, nexx
	syscall
	
	#print index
	li $v0, 1
	addi $a0, $t6, 0
	syscall
	
	#increment index
	addi $t6, $t6, 1
	j loop1

exit:
	
	
	#End of Main
	li $v0, 10
	syscall