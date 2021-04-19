### <ins>Lab7: Single-Cycle CPU</ins>

The purpose of Lab 7 is to learn in-depth how a CPU works. Given the basic single-cycle MIPS CPU, you will add, debug, and test several new features.

//

1. Synthesize the project and generate outputs for the given instruction sequence.

2. In lab 5, you implemented I-format only for ADD. Implement all I-format ALU instructions -
ANDI, SUBI, ORI, SLTI (Hint: you can do this without adding any new hardware, i.e., just by
modifying the control.)

3. Add instruction J. You may start with the general implementation using the text provided in
pre-lab. If you implement your own block, explain with comments. 
    * J target -> This jumps to the address “target”

4. Add instruction JR.
    * JR $s -> This jumps to the address contained in register $s

5. Add instruction BNE.

6. Add instruction LUI.
    *  The immediate value is shifted left 16 bits and stored in the register. The lower 16 bits
        are zeroes.
    * lui $t, imm -> $t = (imm << 16); advance_pc (4);

7. Create a new testbench which tests all the following instructions
    * __ALU__: ADD, ADDI, SUB, SUBI, OR, ORI, AND, ANDI, MOV, NOT, SLT, SLTI 
    * __Memory__: SW, LW, LUI
    * __Branch__: BEQ, BNE
    * __Jump__: J, JR
