# ECE 445 - Computer Organization
	# Programming Assignment #4
	# Write a MIPS assembly language program to determine the length of a C-style string.
	# Note: A C-style string is a null-terminated character array.
	# The string is provided in the .data section below.
	# After running your code, the variable length (in memory) should contain the length of the string.
	# Author:  Kevin Tavara
	# Date:  06.20.2020
	
	.text			
	.globl main		

main:	la $t1, str 		#load the starting addresses of str and length
	la $t2, length  	
	lb $s2, 0($t2)		#load the data in str and length 
	lbu $s1, 0($t1)
	beq $s1, $zero, end	#ensure there is a string
loop:   addi $s2, $s2, 1	#index and length increment
	addi $t1, $t1, 1
	lbu $s1, 0($t1)		#load next char in string
	bne $s1, $zero, loop	#ensure char is not null
	sb $s2, 0($t2)		#save byte to length
	li $v0,1		#prepare to print
	move $a0,$s2		#arguement inserted
	syscall			#make system print
end:    nop		# put breakpoint at this line to end program without warning/error.
	
	.data 0x10010000	
str:	.asciiz	 "Null-terminated String" # Specify a null-terminated string here. 
length:	.byte 0		# The length of the string is written to this variable.
