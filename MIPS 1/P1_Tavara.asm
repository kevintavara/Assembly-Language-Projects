.text
.globl main
main: la $t0, x #load all the addresses of variables
      la $t1, y
      la $t2, z
      la $t3, sum
      lw $s0, 0($t0) #load all data of variables
      lw $s1, 0($t1)
      lw $s2, 0($t2)
      lw $s3, 0($t3)
      add $s3, $s2, $s1 #Summing process 
      add $s3, $s3, $s0
      sw $s3, 0($t3) #Storing sum in address pointing to sum

.data 0x10010000
x: .word 9
y: .word 47
z: .word 126
sum: .word 0

