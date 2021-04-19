############################################################################
#                       Lab 3
#                       EC413
#
#    		Assembly Language Lab -- Programming with Loops.
#
############################################################################
#  DATA
############################################################################
        .data           # Data segment
Hello:  .asciiz " \n Hello World! \n "  # declare a zero terminated string
Hello_len: .word 16
AnInt:	.word	12		# a word initialized to 12
space:	.asciiz	" "	# declare a zero terminate string
WordAvg:   .word 0		#use this variable for part 4
ValidInt:  .word 0		#
ValidInt2: .word 0		#
lf:     .byte	10, 0	# string with carriage return and line feed
InLenW:	.word   4       # initialize to number of words in input1 and input2
InLenB:	.word   16      # initialize to number of bytes in input1 and input2
        .align  4
Input1:	.word	0x01020304,0x05060708
	    .word	0x090A0B0C,0x0D0E0F10
        .align  4
Input2: .word   0x01221117,0x090b1d1f   # input
        .word   0x0e1c2a08,0x06040210
        .align  4
Copy:  	.space  0x80    # space to copy input word by word
        .align  4
 
Enter: .asciiz "\n"
Comma: .asciiz ","
############################################################################
#  CODE
############################################################################
        .text                   # code segment
#
# print out greeting
#
main:
        la	$a0,Hello	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string

	
#Code for Item 2
#Count number of occurrences of letter "l" in Hello string

	li	$t0, 0		# i in for loop
	li	$t1, 0		# counter for the letters
	lw	$t2, Hello_len	# size of string
	la	$t3, Hello	# Load address of Hello
	li	$t4, 'l'		# 'l'

Loop2:					# for(i = 0; i < 16; i++)
	bge	$t0, $t2, Exit_loop2	
	add	$t3, $t3, 1
	lb	$t5, 0($t3)		# Hello[i]
	beq	$t5, $t4, Count		# if (Hello[i] == 'l') -> jump to Count
 	add	$t0, $t0, 1
	j	Loop2
	
Count:
	add	$t1, $t1, 1
	add	$t0, $t0, 1
	j	Loop2

Exit_loop2:
	xor	$a0, $a0, $a0		# Print
	add	$a0, $a0, $t1
	li	$v0, 1
	syscall






################################################################################
        la	$a0,Enter	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string
	 la	$a0,Enter	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string
################################################################################

#
# Code for Item 3 -- 
# Print the integer value of numbers from 0 and less than AnInt
#
	li	$t0, 0		# Counter
	lw	$t1, AnInt	# Loading &AnInt
	xor	$a0, $a0, $a0
	

Loop3:
	bge	$t0, $t1, Exit_loop3
	add	$a0, $a0, $t0		# Printing the int
	li	$v0, 1
	syscall
	xor	$a0, $a0, $a0
	
	la	$a0, space
	li	$v0, 4
	syscall
	xor	$a0, $a0, $a0
	
	add	$t0, $t0, 1
	j	Loop3	

Exit_loop3:	
	xor	$a0, $a0, $a0
	






###################################################################################
        la	$a0,Enter	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string
	 la	$a0,Enter	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string
###################################################################################
#
# Code for Item 4 -- 
# Print the integer values of each byte in the array Input1 (with spaces)
#
	li	$t0, 0				# int i = 0
	
	
	lw	$t3, InLenB			# Input1[i] length = 16
	la	$t4, Input1
	xor 	$a0, $a0, $a0

Loop4:
	bge	$t0, $t3, Exit_loop4		# i = 0 to 15

	lb	$t5, 0($t4)			# Print a byte of Input1[i]
	add	$a0, $a0, $t5
	li	$v0, 1
	syscall
	xor	$a0, $a0, $a0
	
	la	$a0, space			# Print space
	li	$v0, 4
	syscall
	xor	$a0, $a0, $a0

	add	$t4, $t4, 1
	add	$t0, $t0, 1
	j	Loop4


Exit_loop4:
	xor	$a0, $a0, $a0
	








###################################################################################
#
# Code for Item 5 -- 
# Write code to copy the contents of Input2 to Copy
#
	la	$t0, Input2
	la	$t1, Copy
	li	$t3, 0
	li	$t4, 4

Loop5:
	bge	$t3, $t4, Exit_loop5
	lw	$t2, 0($t0)
	sw	$t2, 0($t1)
	add	$t3, $t3, 1
	add	$t0, $t0, 4
	add	$t1, $t1, 4
	j	Loop5

Exit_loop5:
	
	











#################################################################################
        la	$a0,Enter	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string
	 la	$a0,Enter	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string
###################################################################################
#
# Code for Item 6 -- 
# Print the minimum, maximum, and integer average of the contents of array Input1
#
	la	$t0, Input1
	lw	$t1, 0($t0)	# Min
	lw	$t2, 0($t0)	# Max
	li	$t3, 0		# Mean
	li	$t4, 0		# Counter
	lw	$t5, InLenW	# 4

Loop6:
	bge	$t4, $t5, Exit_loop6
	lw	$t6, 0($t0)
	add	$t0, $t0, 4

	add	$t3, $t3, $t6
	
	blt	$t6, $t1, Min
	bgt	$t6, $t2, Max	
	add	$t4, $t4, 1
	j	Loop6
	
	
Min:
	xor	$t1, $t1, $t1
	add	$t1, $t1, $t6
	add	$t4, $t4, 1
	j	Loop6
Max:
	xor	$t2, $t2, $t2
	add	$t2, $t2, $t6
	add	$t4, $t4, 1
	j	Loop6

Exit_loop6:
	xor 	$a0, $a0, $a0		#Print Min
	add	$a0, $a0, $t1
	li	$v0, 1
	syscall

	xor 	$a0, $a0, $a0		
	la	$a0, space
	li	$v0, 4
	syscall

	xor 	$a0, $a0, $a0		#Print Max
	add	$a0, $a0, $t2
	li	$v0, 1
	syscall

	xor 	$a0, $a0, $a0
	la	$a0, space
	li	$v0, 4
	syscall
	
	div	$t7, $t3, $t5		#Print Mean
	xor 	$a0, $a0, $a0
	add	$a0, $a0, $t7
	li	$v0, 1
	syscall













#################################################################################
        la	$a0,Enter	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string
	 la	$a0,Enter	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string
##################################################################################
#
# Code for Item 7 -- 
# Display the first 30 integers that are divisible by either 7 and 13 (with comma)
#

	li	$t0, 0		# Counter for the number
	li	$t1, 30		# Number of ints wanted
	li 	$s2, 0		# Counter increment
	li	$t5, 13		# Div value
	li	$s0, 7		# Div value
	

	
Loop7:
	bge	$s2, $t1, Exit_loop7

	div	$t2, $t0, $s0	# Div by 7
	mfhi	$t3

	div	$t6, $t0, $t5	# Div by 13
	mfhi	$t7
	
	beqz	$t7, Print7
	beqz	$t3, Print7
	
	add	$t0, $t0, 1		
	j Loop7

Print7:
	

	xor	$a0, $a0, $a0
	add	$a0, $a0, $t0
	li	$v0, 1
	syscall
	
	xor 	$a0, $a0, $a0
	la	$a0, Comma
	li	$v0, 4
	syscall
	
	add	$t0, $t0, 1
	add	$s2, $s2, 1
	j	Loop7
	
Exit_loop7:
	










#################################################################################
        la	$a0,Enter	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string
 	la	$a0,Enter	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string
##################################################################################
#
# Code for Item 8 -- 
# Repeat step 7 but display the integers in 6 lines with 5 integers with spaces per line
# This must be implemented using a nested loop.
#

	li	$t0, 0		# Counter for the number
	li 	$s2, 0		# Counter increment
	li	$t5, 13		# Div value
	li	$s0, 7		# Div value
	li	$s1, 5
	li	$s3, 0
	li	$s4, 6
	li	$s5, 0
	
O_loop8:
	bge	$s5, $s4, Exit_O_loop
	
Loop8:
	bge	$s2, $s1, Exit_loop8

	div	$t2, $t0, $s0	# Div by 7
	mfhi	$t3

	div	$t6, $t0, $t5	# Div by 13
	mfhi	$t7
	
	beqz	$t7, Print8
	beqz	$t3, Print8
	
	add	$t0, $t0, 1		
	j Loop8

Print8:
	
	xor	$a0, $a0, $a0
	add	$a0, $a0, $t0
	li	$v0, 1
	syscall
	
	xor 	$a0, $a0, $a0
	la	$a0, Comma
	li	$v0, 4
	syscall
	
	add	$t0, $t0, 1
	add	$s2, $s2, 1
	j	Loop8
	
Exit_loop8:
	xor 	$s2, $s2, $s2
	add 	$s5, $s5, 1

	la	$a0,Enter	# address of string to print
        	li	$v0,4		# system call code for print_str
        	syscall                 # print the string
	
	j	O_loop8
	

Exit_O_loop:
	xor $a0, $a0, $a0

Exit:
	jr $ra