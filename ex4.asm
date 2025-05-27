.data
	str:	.asciiz	"Chocolate Factory\n"
	target:	.asciiz	"aoh"
	len1:	.word	17
	len2:	.word	3
	cnt:	.word	0
	msg:	.asciiz	"The count is : "

.text
.globl main

main:
    # Print "The count is : "
    li $v0, 4
    la $a0, msg
    syscall

    # Load base addresses of str and target
    la $s0, str       # $s0 = str
    la $s1, target    # $s1 = target

    # Load len1 and len2
    lw $s2, len1      # $s2 = len1 (17)
    lw $s3, len2      # $s3 = len2 (3)

    li $t0, 0         # i = 0

loop_outer:
    # if i >= len2, exit loop
    slt $t1, $t0, $s3
    beq $t1, $zero, end_outer

    # Load target[i] into $a2
    add $t2, $s1, $t0
    lb $a2, 0($t2)     # ch = target[i]

    # Call countletters(str, len1, ch)
    move $a0, $s0      # str
    move $a1, $s2      # len1
    # $a2 already set

    jal countletters

    # Print returned count in $v0
    move $a0, $v0
    li $v0, 1
    syscall

    # Print a space
    li $v0, 4
    la $a0, space
    syscall

    # i++
    addi $t0, $t0, 1
    j loop_outer

end_outer:
    # Print newline
    li $v0, 11
    li $a0, 10     # ASCII newline
    syscall

    # Exit
    li $v0, 10
    syscall

######################################################
# int countletters(char str[], int N, char ch)
# Inputs:  $a0 = str, $a1 = N, $a2 = ch
# Returns: $v0 = count
######################################################
countletters:
    li $t0, 0       # i = 0
    li $t1, 0       # cnt = 0

loop_count:
    # if i >= N, return
    slt $t2, $t0, $a1
    beq $t2, $zero, end_count

    # str[i]
    add $t3, $a0, $t0
    lb $t4, 0($t3)

    # if str[i] == ch, cnt++
    beq $t4, $a2, inc_cnt
    j skip_inc

inc_cnt:
    addi $t1, $t1, 1

skip_inc:
    addi $t0, $t0, 1
    j loop_count

end_count:
    move $v0, $t1
    jr $ra

.data
space:  .asciiz " "
