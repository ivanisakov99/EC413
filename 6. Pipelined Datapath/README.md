### <ins>Lab6: Pipelined Datapath:</ins>

The purpose of Lab 6 is to gain additional experience with digital design and with how computers work by The purpose of Lab 6 is to gain additional experience with digital design and with how computers work by building, debugging, and testing a **4-stage** 32-bit pipelined datapath shown in the figure below.

//

**Registers and Buses**

A good practice is to name your registers with a prefix telling which pipeline stage they belong to
S1_RS1, S1_RS2, S1_IMM, S1_ALUOP, S1_WS, S1_WE, S2_RD1, S2_RD2, etc. You should take a similar 
approach to labeling your buses. The table below shows a number of the internal buses and their 
widths. You can extrapolate the rest by following the paths. Interfaces to your top module are shown in yellow and are also shown in the first part of the table below. Lines which are originating in the pipeline stages are shown in blue and are also shown in the second part of the following table. Not shown are reset, clock, and logic to route the instruction from the testbench to the Stage1 registers.

| Wires     | Size      | Information       |
|:----------|:----------|:------------------|
| InstrIn   | 32 bit    | Instruction Input |
| ALUOut    | 32 bit    | ALU Output        |
| Reset     | 1 bit     | Resets all sequential logic to zero |
| Clk       | 1 bit     | Clock for all sequential logic |
| ReadSelect1   | 5 bit | Register select for first read register |
| ReadSelect2   | 5 bit | Register select for second read register |
| WriteSelect   | 5 bit | Register select for input register |
| Imm       | 16 bit    | Immediate data |
| DataSrc   | 1 bit     | Data source selection for second operand |
| ALUOp     | 3 bit     | ALU operation |
| WriteEnable   | 1 bit | Register file write enable |
| ReadData1 | 32 bit    | Register output 1 |
| ReadData2 | 32 bit    | Register output 2 |

**Operation**

In a pipeline running in steady state, components in each pipeline stage are active all the time, each executing a different instruction. For example, one instruction is driving the S1 register inputs, a second instruction is driving the S2 inputs (with some signals going through the register file), a third instruction is driving the S3 inputs (with some signals going through the MUX and the ALU), and a fourth instruction driving the input ports of the register file. When the clock edge rises, all of these signals are latched simultaneously and each instruction either completes or starts driving the next stage

**Instruction Format**

All instructions are 32-bit, and the format is the following.

| Type  | 31 - 26   | 25 - 21 | 20 - 16 | 15 - 0 |
|:------|:----------|:--------|:--------|:-------|
| R     | opcode(6) | r1(5)   | r2(5)   | r3(5)  |
| I     | opcode(6) | r1(5)   | r2(5)   | imm(16)|

For this lab, you will only be implementing R-Type and I-Type instructions. Also, for simplicity, the interpretation of the opcode field will not be the same as MIPS, it will instead have the following format:

* The most significant bit (31) is unused.

* The next most significant bit of the opcode (30) determines whether the instruction is
Logical/Arithmetic (1) or other (0). This will always be set for this lab.

* The third bit of the opcode (29) determines whether the instruction uses an immediate operand (1)
or not (0). That is, if this bit is set, the instruction follows the I-type template.

* The least significant 3 bits of the opcode field (28-26) are fed into the ALU’s ALUOp input.

* The ALU has the following functions:

| AOp2  | AOp1  | AOp0  | Output                    | Function Name |
|:-----|:-----|:-----|:---------|:--------------|
| 0     | 0     | 0     | R1 =~ R2                  | NOT           |
| 0     | 0     | 1     | R1 = R2                   | MOVE          |
| 0     | 1     | 1     | R1 = R2 \| R3             | OR            |
| 1     | 0     | 0     | R1 = R2 & R3              | AND           |
| 1     | 1     | 0     | R1 = R2 - R3              | SUB           |
| 1     | 0     | 1     | R1 = R2 + R3              | ADD           |
| 1     | 1     | 1     | R1 = 1, if R2 < R3, else 0| SLT           |
