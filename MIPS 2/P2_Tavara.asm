	# ECE 445 - Computer Organization
	# Programming Assignment #2
	# Write a MIPS assembly language program to count the number of positive values in an array of integers.
	# The array of integers and the array length are provided in the .data section below.
	# After running your code, the variable count (in memory) should contain the number of positive values in the array.
	# Author:  Kevin Tavara
	# Date:  06.15.2020
	
	.text			
	.globl main		

main:	la $t1, lenA		# load the address of variable lenA into $t1
	la $t2, arrayA		# load the starting address of arrayA into $t2
	la $t3, count
	lw $s1, 0($t1) #loads data associated with label
	lw $s3, 0($t3)
	addi $t5, $zero, 0 	#saves zero to use as counter 
loop:   lw $s2, 0($t2) 		#loads word at the beginning of the array
	slt $s0, $zero, $s2 	#determines if positive if so then saves 1 else 0
	add $s3, $s3, $s0 	#count that increments based on positive values
	addi $t5, $t5, 1 	#counter that increments by 1 
	addi $t2, $t2, 4 	#increments the index
	bne $t5, $s1, loop 	#ends loop when array has reached final index
	sw $s3, 0($t3)		#saves the word in the address pointing to count
	li $v0,1		#prepares to print
	move $a0,$s3		#moves data to be printed
	syscall			#prints data
	nop		# put breakpoint on this line when running your code
	
	.data 0x10010000
lenA:	.byte 0x20 # Specify the length of the array here (maximum length = 255 elements)	
arrayA:	.word -2, 1, 0, -1, 5, 10, -12, -15, 12, 34, -23, -3, 1, 2, 3, 4, -1, 3, -3, 1, -2, -15, 12, 34, -23, -3, 1, 2, 3, -2, 1, 10 # Specify the integer array here (the number of elements must be the same as the length specified above)
count:	.word 0


