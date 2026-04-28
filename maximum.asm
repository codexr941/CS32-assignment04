# maximum.asm program
# CS 64, Z.Matni
#
# Get 3 integer inputs from the user (std.in)
# Reveal the maximum absolute value (e.g., entering -3, 2, 1 will give the answer 
# 3）
# See assignment description for details
#Data Area (i.e. memory setup directive)
.data
# TODO: Complete these incomplete declarations / initializations
prompt:     .asciiz "Enter number:\n"
maxText:    .asciiz "Maximum: "
newline:    .asciiz "\n"
#Text Area (i.e. instructions/code directive)
.text
main:
li $v0, 4             
la $a0, prompt
syscall

li $v0, 5              
syscall
move $t0, $v0

li $v0, 4
la $a0, prompt
syscall

li $v0, 5
syscall
move $t1, $v0

li $v0, 4
la $a0, prompt
syscall

li $v0, 5
syscall
move $t2, $v0

slt $t3, $t0, $zero  
beq $t3, $zero, abs1_done
sub $t0, $zero, $t0   

abs1_done:
slt $t3, $t1, $zero
beq $t3, $zero, abs2_done
sub $t1, $zero, $t1

abs2_done:
slt $t3, $t2, $zero
beq $t3, $zero, abs3_done
sub $t2, $zero, $t2

abs3_done:
move $t4, $t0 
slt $t3, $t4, $t1      
beq $t3, $zero, check_t2
move $t4, $t1

check_t2:
slt $t3, $t4, $t2      
beq $t3, $zero, print_result
move $t4, $t2

print_result:
# Print "Maximum: "
    li $v0, 4
    la $a0, maxText
    syscall

    # Print maximum integer
    li $v0, 1
    move $a0, $t4
    syscall

    # Print newline
    li $v0, 4
    la $a0, newline
    syscall

    j exit

# TODO: Write your code here
# You can have other labels expressed here, if you need to
exit:
    li $v0, 10
    syscall
# TODO: Write code to properly exit a SPIM simulation
