### <ins>Lab5: ALU</ins>
The purpose of lab 5 is to continue to gain experience with: 

* Hierarchical design

* Useful components (i.e., an ALU)

* Creating good test benches that have a convincing set of test cases and automatic verification 

This lab also adds:

* A sequential component

* The need for a more complex testbench to handle sequential logic and multiple functions

* Parameterization using the Verilog constructs **generate**, and **parameter**

In this lab you will design, implement, and test a 32-bit ALU and output register:

![Screenshot 2021-04-19 at 13 03 51](https://user-images.githubusercontent.com/60196280/115276119-a7b2e580-a110-11eb-9fd7-fc98db9ed25a.png)

Behavioral requirements:

The ALU generates a final carry out, overflow and zero output 

Zero output flag has to be set when output is 0

Carry output flag has to be set when the register cannot properly represent the result as an unsigned value (no sign bit required)

Overflow output flag has to be set when the register cannot properly represent the result as a signed value (you overflowed into the sign bit)

