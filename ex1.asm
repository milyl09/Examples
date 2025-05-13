.data
# Declare variables in memory
g: .word 7
h: .word 3
i: .word 5
j: .word 5
f: .word 0   # We'll store the result here

.text
.globl main
main:
 # Load values from memory into registers
   lw $t1, g     # $t1 = g
   lw $t2, h     # $t2 = h
   lw $t3, i     # $t3 = i
   lw $t4, j     # $t4 = j

 # if (i == j)
   bne $t3, $t4, false  
 # f = g + h
   add $t0, $t1, $t2       
   j endif 
false: 
   sub $t0, $t1, $t2 
endif:   
 # Store result back to memory      
   sw $t0, f
# Exit program
   li $v0, 10
   syscall


