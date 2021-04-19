### <ins>Lab8: Pipeline CPU 1</ins>

The purpose of Lab 8 is to learn in-depth how a pipelined CPU works. For this lab, you are given a pipelined CPU with no data forwarding or a hazard detection unit. Your job is to design a hazard detection unit for a pipelined CPU with no forwarding support. The pipeline should therefore be stalled for load-use, one-ahead and two-ahead hazards. A detailed diagram of the CPU used in this lab is also included on the next page. Note that the forwarding unit is missing, and will be introduced in lab 9.

Below is a small MIPS program. Start by implementing a testbench for this program, and deter- mine where the hazards are occurring. Then, work through which logic your hazard detection unit needs to deal with each hazard. Your pipeline should stall dependent instructions until the source for hazard is written back to the register file. Your final design should be able to run this code with no hazards.

    addi R1, R0, 8
    addi R2, R0, 23
    addi R3, R0, 736
    addi R4, R0, 1
    addi R5, R0, 10
    lw   R6, 4(R0)
    or   R9, R6, R3
    sub  R8, R1, R2
    add  R10, R5, R9
    sw   R7, 8(R0)
    addi R11, R10, 57
    and  R12, R7, R2
    slt  R13, R11, R12

1. Implement and synthesize the testbench and identify data hazards.

2. Add load-use hazard detection.

3. Add arbitration logic for detecting 1-ahead and 2-ahead hazards to your hazard detection logic.

![Screenshot 2021-04-19 at 14 22 39](https://user-images.githubusercontent.com/60196280/115284548-d2a23700-a11a-11eb-9211-f1cb2dae5f97.png)
