###############################################################################
#			Tutorial
#           EC413 -- Computer Organization
#
# This program initializes and sorts an array
###############################################################################
        .data                     # Data segment.  ".data" is a key word that denotes
							      # the beginning of your data declarations.
numbs:	.word	5, 7, 4, 3		  # Allocate four words and init to 5,7,4,3
msg:    .asciiz "\nThe sorted array is  \n "
count:  .word   4		          # number of elements in the array
##############################################################################
# Begin code.
############################################################################## 
        .text                     # code segment.  ".text" is a key word that denotes
							      # the beginning of your executable.
#
# The following loop initializes values in array `numbs' to ....
#
main:
        la      $t1,numbs		  # load $t1 with the address of array numbs
        lw      $t0,count      	  # t0 is is a counter initilizer
init_loop:
        blez	$t0,sort_loop     # done with loop when $t0 <= 0 
        sw      $t0,0($t1)        # Stores $t0 in array location pointed by $t1
        sub     $t0,$t0,1         # decrement $t0
        add     $t1,$t1,4     	  # increment to next element of array
        j       init_loop	      # jump back to top of loop
#
#  Sort the array
#
sort_loop:
        li      $t0,1              # $t0 is done = true
        li      $t1,0              # $t1 is the array index
        lw      $t6,count	       # $t6 is the loop counter
for:
        la      $t2,numbs          # load t2 with the address of array numbs
        add     $t2,$t2,$t1        # compute the next array index
        lw      $t3,0($t2)         # load an element
        lw      $t4,4($t2)         # load the next element
        sub     $t5,$t3,$t4        # compare the elements by subtracting
        blez    $t5,noswap         # if they are in order don't swap
        li      $t0,0              # done = false ( not done yet)
        sw      $t3,4($t2)         # swap the elements
        sw      $t4,0($t2)
noswap:
        add     $t1,$t1,4	       # Increment the array index by word size 
                                   #   to point to the next element 
        sub     $t6,$t6,1          # Decrement loop counter
        bgtz    $t6,for            # Check for end of array
        beq     $t0,$0,sort_loop   # loop until done
# 
# Print the array to the console
# 
        la      $t2,numbs          # load t2 with the address of array numbs
        lw      $t3,count          # t3 is our counter
        li      $v0,4              # system call code for print_str
        la      $a0,msg            # address of string to print
        syscall                    # print the string
disp:                              # Loop on $t3/count
        li      $v0,1              # system call code for print_int
        lw      $a0,($t2)          # load the integer to be printed into reg a0
        syscall	                   # print it
        add     $t2,$t2,4          # increment to point to next element of array
        add     $t3,$t3,-1         # decrement counter
        bgtz    $t3,disp           # loop till all the elements are displayed

Exit:
    jr $ra
		
