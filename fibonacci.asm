# fibonacci.asm program
# CMPSC 64, (c) 2025, Z.Matni
#
# unsigned int n, f1 = 1, f2 = 1, i = 2, nextfib;
# cout << "Enter a number:\n";
# cin >> n;
# if (n > 1) {
# cout << "The first " << n << " numbers in the Fibonacci series are:\n";
# cout << f1 << " " << f2;
# while (i < n) {
# nextfib = f1 + f2;
# f1 = f2;
# f2 = nextfib;
# cout << " " << nextfib;
# i++;
# }
# }
# cout << endl;

.data
prompt:.asciiz "Enter a number:\n"
first:.asciiz "The first "
numbers:.asciiz " numbers in the Fibonacci series are:\n"
spacech:.asciiz " "
newline:.asciiz "\n"

.text
main:
li $v0,4
la $a0,prompt
syscall

li $v0,5
syscall
move $t0,$v0

li $t1,1
li $t2,1
li $t3,2

slti $t4,$t0,2
bne $t4,$zero,exit

li $v0,4
la $a0,first
syscall

li $v0,1
move $a0,$t0
syscall

li $v0,4
la $a0,numbers
syscall

li $v0,1
move $a0,$t1
syscall

li $v0,4
la $a0,spacech
syscall

li $v0,1
move $a0,$t2
syscall

loop:
slt $t4,$t3,$t0
beq $t4,$zero,exit

add $t5,$t1,$t2
move $t1,$t2
move $t2,$t5

li $v0,4
la $a0,spacech
syscall

li $v0,1
move $a0,$t5
syscall

addi $t3,$t3,1
j loop

exit:
li $v0,4
la $a0,newline
syscall

li $v0,10
syscall
