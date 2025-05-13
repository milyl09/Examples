.data
# Declare variables in memory
g: .word 7
h: .word 3
i: .word 5
w: .word 5
f: .word 0

.text
.globl main
main:
 # Load values from memory into registers
    lw $t1, g         
    lw $t2, h         
    lw $t3, i         
    lw $t4, w         

 # if (i == j)
    bne $t3, $t4, false

 # f = g + h
    add $t0, $t1, $t2        
    j end_if                 

false:
    sub $t0, $t1, $t2        # f = g - h

end_if:
 # Store result back to memory  
    sw $t0, f               
# Exit program
    li $v0, 10               
    syscall

