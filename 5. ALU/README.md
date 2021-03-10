The purpose of this assignment is to continue to gain experience with: 
* Hierarchical design
* Useful components (i.e., an ALU)
* Creating good test benches that have a convincing set of test cases and automatic
verification 

This lab also adds:
* A sequential component
* The need for a more complex testbench to handle sequential logic and multiple functions
* Parameterization using the Verilog constructs __generate__, and __parameter__

In this assignment you will design, implement, and test a 32-bit ALU and output register:


The lines used as inputs and outputs to the ALU are highlighted in the diagram.
| Variables |   Size  |  Info  |
|---|---|---|
|   R0      |   32 bit  |  Register Output  |
| ZERO      |   1 bit   |  Register Output  |
| OVERFLOW  |   1 bit   |  Register Output  |
| CARRY     |   1 bit   |  Register Output  |
|   R1      |   32 bit  |    ALU Output     |
|   R2      |   32 bit  |    ALU Input 1    |
|   R3      |   32 bit  |    ALU Input 2    |
|  ALUOp    |   3 bit   |    ALU Operation  |

The ALU has the following functions:
| __Function Name__ | ... | ... | __Output__ | __Command__ |
|---|---|---|---|---|
| __AOp2__ | __AOp1__ | __AOp0__ |  __...__ |  __...__  |
| 0 | 0 | 0 | *R1 = R2* | MOV |
| 0 | 0 | 1 | *R1 = ~R2* | NOT |
| 0 | 1 | 1 | *R1 = R2 & R3* | AND |
| 1 | 0 | 0 | *R1 = R2 / R3* | OR |
| 1 | 0 | 1 | *R1 = R2 - R3* | SUB |
| 1 | 1 | 0 | *R1 = R2 + R3* | ADD |

