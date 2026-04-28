# arithmetic.asm program
# CS 64, Z.Matni
#
# 1. Prompt the user for 3 inputs: a, b, c
# 2. Calculate 64*( a - 4*b) + 9*c using only one mult instruction
# 3. Print out the result

.text
main:
	li $v0,5
	syscall
	move $t0,$v0
	li $v0,5
    syscall
	move $t1,$v0
    li $v0,5
	syscall
	move $t2,$v0
	sll $t1,$t1,2
    sub $t0,$t0,$t1
	sll $t0,$t0,6
	li $t3, 9
    mult $t2, $t3
    mflo $t2
	add $a0,$t0,$t2
	li $v0,1
	syscall
	
	j exit


exit:
	# Exit SPIM: Write your code here!
    li $v0,10
	syscall
