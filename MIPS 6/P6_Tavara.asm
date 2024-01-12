	# ECE 445 - Computer Organization
	# Programming Assignment #6
	# Write a MIPS assembly language program to count the number of words in a C-style string.
	# The result should be written to the variable num in memory.
	# Simulate your program for different length strings. 
	# Author:  Kevin Tavara
	# Date:  07.07.2020


	.text			
	.globl main		

main:	la $s1, str		# load the starting address of string str into $s1
	la $t1, num		# load the address of variable num into $t1
	lw $t0, 0($t1)		# load num
	addi $s2, $zero, 96	# ascii values
	addi $s3, $zero, 64
	addi $s6, $zero, 32
	addi $s4, $zero, 3	# minimum to be letter
	addi $t6, $zero, 1	# value to compare
	addi $s7, $zero, 0	# checks if last element was letter
L1:     lb $s0, 0($s1)		# load the byte 
	beq $s0, $s6, L3	# checks for space
	beq $s0, $zero, L4	# checks for end
	addi $s7, $zero, 0	# reset
	slt $t2, $s2, $s0	# these are for 60 < $t2 < 7B
	slti $t3, $s0, 123
	slt $t4, $s3, $s0	# these are for 40 < $t2 < 5B
	slti $t5, $s0, 91
	add $s5, $t2, $t3	# stores sum
	add $s5, $s5, $t4
	add $s5, $s5, $t5
	bne $s5, $s4, L2	# checks if not a word
	addi $s7, $zero, 1	# asserts last element was a letter
	addi $s1, $s1, 1	# address increment
	j L1
L2:     addi $s1, $s1, 1	# address increment
	lb $s0, 0($s1)		# load the byte
	beq $s0, $zero, end	# checks if end
	beq $s0, $s6, L1	# if space moves onto next potential word
	j L2			# exhausts non-word string till space or end
L3:     beq $s7, $t6, L5	# if letter sends to increment num
	addi $s1, $s1, 1	# address increment
	j L1
L4:     beq $s7, $t6, L5	# checks if final string was a word
	j end
L5:     addi $t0, $t0, 1	# num increment
	beq $s0, $zero, end	# checks if end
	addi $s1, $s1, 1	# increment address
	addi $s7, $zero, 0	# reset 
	j L1
end:	sw $t0, 0($t1)	# store final num
	nop		# put breakpoint on this line when running your code
	
	.data 0x10010000	
str:	.asciiz "This is !! hard     I think  %this% works% "	# Specify a null-terminated string here. 
num:    .word 0
