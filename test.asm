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
	
	#declare total reg
	li $t4, 0
	
	
	
loop1:
	beq $t6, 10, exit
	
	#print each character
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
	addi $t5, $s1, 65		# t5 = s1 + ord(a)
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
	or $s7, $s2, $s3
	or $s7, $s7, $s5
	
	
	
	#if not valid, skip to next char
	li $t8, 1
	bne $s7, $t8, increment
	
	#separate numbers from other valid inputs
	bne $s2, $t8, letters
	li $t2, 0			#temporary increment
	li $t9, 48
	sub $t2, $a0, $t9
	add $t4, $t4, $t2
	j increment

letters:
	#separate small letters from big letters
	bne $s3, $t8, small
	li $t2, 0			#temporary increment
	li $t9, 65
	sub $t2, $a0, $t9
	addi $t2, $t2, 10
	add $t4, $t4, $t2	
	j increment
	
small:
	li $t2, 0			#temporary increment
	li $t9, 97
	sub $t2, $a0, $t9
	addi $t2, $t2, 10
	add $t4, $t4, $t2
	
	li $v0, 11
	#print index
	li $v0, 1
	addi $a0, $t6, 0
	syscall
	
increment:	
	#increment index
	addi $t6, $t6, 1
	j loop1

exit:
	
	
	#End of Main
	li $v0, 10
	syscall