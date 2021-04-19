### <ins>Lab9: Pipeline CPU 2</ins>

The purpose of Lab 9 is to learn more about the workings of a pipelined CPU. For this lab, you are given a pipelined CPU with a data forwarding unit. Unfortunately, someone has deleted the logic from the forwarding unit, as well as where it connects in the CPU. Your job is to reconnect the forwarding unit, and implement the data forwarding logic. Figure 4.54 in the Hennessy and Patterson textbook will be helpful in understanding how this unit works, and where it connects. A detailed diagram of the CPU used in this lab is also included on the next page. Your final CPU should be able to deal with data forwarding for both R-type and I-type instructions, and should work for reading from any register in either the Rs or Rt position. It should also be able to deal with hazards at either the ex/mem pipeline register or mem/wb pipeline register. In other words, your forwarding unit should work in all cases.

Below is a small MIPS program. Start by implementing a testbench for this program, and deter- mine where the hazards are occurring (note that not all instructions need forwarding. You must determine which ones do). Then, work through which logic your forwarding unit needs to deal with each hazard. Your final design should be able to run this code with no hazards.

    addi R1, 423 
    addi R2, 92 
    addi R3, 13 
    addi R4, 146 
    addi R5, 5
    add R5, R1, R4 
    slt R6, R3, R5 
    lw R4, 4(R0) 
    sub R7, R4, R6 
    sw R7, 2(R0) 
    add R8, R7, R2

1. Modify your hazard detection unit from lab 8 to handle only load-use hazards.
2. Add 1 ahead forwarding. [1 ahead Rt] 
3. Add 2 ahead forwarding.
4. Read register write signals to avoid overwriting branch instructions.
5. Add arbitration logic for deciding between 1 & 2 ahead forwarding.

![Screenshot 2021-04-19 at 14 22 39](https://user-images.githubusercontent.com/60196280/115285121-7f7cb400-a11b-11eb-9a6b-83582e23fba5.png)
