### <ins>Tasks:</ins>
1. Load the program. In the sub-window labeled “Text Segments” you should see your code (level 3), along with the level 2 (bare MIPS assembly language) and
level 1 (MIPS machine language) equivalents. SPIM actually does not start execution with your program, but rather with some set-up code. You should find 
your program following a “syscall” instruction.
2. Begin by clicking on run. Note and write down the output. Simply loading and running the program should have worked fine this time, but in general your programs will need to be debugged. In that case, simply clicking on run will just give you garbage, and worse, little way to figure out what went wrong.
3. Reload the program. This time, single step until you reach the instruction corresponding to ‘main.’ The last debugger instruction executed should be ‘jal main’ which transfers control to your program.
4. In class, for convenience, we assume that the data starts at memory location 0. Where does SPIM put it? What is the address of variable “msg”? Where is the variable “count”?
5. Continue to single step through the program until you reach the instruction corresponding to the label ‘sort loop’. What’s happening? Observe the values being loaded into the array in the data segment as you step through the program. What are the new array values?
6. Insert a breakpoint at the instruction corresponding to the ‘noswap’ label.
7. Continue execution using the run command (repeatedly) until the program ends. Write down the contents of the array each time the breakpoint is encountered.
8. Reload the program. This time, insert a breakpoint at “sw $t4,0($t2)” and run the program.
9. At the breakpoint, change the value of register $t4 to 0 and the value of the second element of the array to 7.
10. Repeat step 8.
11. Modify the program so that it sorts 8 numbers instead of 4. Reload and run it. What are the array values this time?
