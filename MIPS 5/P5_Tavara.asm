	# ECE 445 - Computer Organization
	# Programming Assignment #5
	# Write a MIPS assembly language program to reverse the order of the elements in an integer array.
	# The length of the array and the array elements are specified in the .data section below.
	# Author:  Kevin Tavara
	# Date:  06.29.2020
	
	.text			
	.globl main		

main:	la $t1, lenA		# load the address of variable lenA into $t1
	la $t0, arrayA
	la $t2, arrayA		# load the starting address of arrayA into $t2
	la $t4, arrayA
	lb $s1, 0($t1)		# load byte in lenA
	addi $s0, $zero, 0	# counter
L1:     addi $sp, $sp, -4	# stack decrement
	lw $s2, 0($t2)		# load word in array
	sw $s2, 0($sp)		# push word on stack
	addi $t2, $t2, 4	# increment address
	addi $s0, $s0, 1	# increment counter
	bne $s0, $s1, L1	# check if end of array
	addi $s0, $zero, 0	# reset counter
L2:     lw $s2, 0($sp)		# pop word off stack
	addi $sp, $sp, 4	# stack increment
	sw $s2, 0($t0)		# saves words starting from beggining of array
	addi $t0, $t0, 4	# increment address
	addi $s0, $s0, 1	# increment counter
	bne $s0, $s1, L2	# check if end of array
	nop		# put breakpoint at this line to end program without warning/error.
	
	.data 0x10010000
lenA:	.byte	10 
arrayA:	.word 	1, 2, 3, 4, 5, 6, 7, 8, 9, 10
