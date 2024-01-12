	# ECE 445 - Computer Organization
	# Programming Assignment #4
	# Write a MIPS assembly language program to convert lower-case letters in a string to upper-case letters.
	# Assume that the string can contain any valid ASCII character.
	# The string is specified in the .data section below.
	# Author:  Kevin Tavara
	# Date:  06.26.2020
	
	.text			
	.globl main		

main:	la $t1, str 		# load the starting address of string str1 into $t1
	la $t4, str1		# load the addresses of the two strings
	la $t5, str2
	lb $s0, 0($t4)		# load the byte stored in the two strings
	lb $s1, 0($t5)
	addi $s4, $zero, 2	# store the value 2 to compare
loop:   lb $t2, 0($t1)		# load the byte 
	beq $t2, $zero, end 	# ensure not null
	slt $s2, $s0, $t2	# these are for 60 < $t2 < 7B
	slt $s3, $t2, $s1
	add $s5, $s2, $s3	# stores sum
	beq $s5, $s4, lower	# if $s5 is 2 then must be lowercase
	sb $t2, 0($t1)		# save byte
	addi $t1, $t1, 1	# address increment
	j loop			
lower:	sub $t2, $t2, 32	# makes lower case upper case
	sb $t2, 0($t1)		# save new byte
	addi $t1, $t1, 1	# address increment
	j loop		

end:    li $v0,4		#this was used to print the result to ensure my code works
	la $a0, str		
	syscall	
	nop		# put breakpoint at this line to end program without warning/error.
	
	.data 0x10010000	
str:	.asciiz "{I hope this Works!!}"	# Specify a null-terminated string here.
str1:	.ascii "`"			# str1 & str2 are used to compare
str2:	.ascii "{"