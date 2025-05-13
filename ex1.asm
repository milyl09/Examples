.data
g: .word 7
h: .word 3
i: .word 5
j: .word 5
f: .word 0

.text
.globl main
main:
    lw $t1, g         # Load g into $t1
    lw $t2, h         # Load h into $t2
    lw $t3, i         # Load i into $t3
    lw $t4, j         # Load j into $t4

    bne $t3, $t4, else_part  # If i != j, go to else

    add $t0, $t1, $t2        # f = g + h
    j end_if                 # Skip else part

else_part:
    sub $t0, $t1, $t2        # f = g - h

end_if:
    sw $t0, f                # Store result in f

    li $v0, 10               # Exit program
    syscall

