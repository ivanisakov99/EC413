`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2021 09:36:01 PM
// Design Name: 
// Module Name: Pipeline
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Pipeline(out, Instrin, clk, reset);

input [31:0] Instrin;
input clk, reset;
output [31:0]out;

//Stage1
wire[31:0] S1_ReadSelect1, S1_ReadSelect2;
wire[15:0] S1_Imm;
wire[4:0] S1_WriteSelect;
wire[2:0] ALUop;
wire Datasource;
wire S1_WriteEnable;

//Reg connection
wire [31:0]reg_ReadData1, reg_ReadData2;

//stage 2
wire[31:0] S2_readData1, S2_readData2;
wire[15:0] S2_Imm;
wire[4:0] S2_writeselect;
wire[2:0] S2_ALUOp;
wire S2_DataSource;
wire S2_WriteEnable;

//Mux
wire [31:0]Mux_out;

//alu
wire [31:0] ALU_out;

//stage 3
wire [31:0] S3_out;
wire [4:0] S3_WriteSelect;
wire S3_WriteEnable;


// stage 1 instrIn into dff
Stage1 stage_1(S1_ReadSelect1, S1_ReadSelect2, S1_Imm,S1_WriteSelect, ALUop, Datasource, S1_WriteEnable,Instrin,clk,reset);//This is stage 1

//take in Rs1 and Rs2 from stage 1 and WS and WE from stage 3
nbit_register_file reg_file(S3_out, reg_ReadData1, reg_ReadData2, S1_ReadSelect1, S1_ReadSelect2,S3_WriteSelect, S3_WriteEnable,reset, clk);


//stage 2 takes in RD1 and RD2 from reg, rest from stage 1
stage2 stage_2(S2_readData1,S2_readData2,S2_ALUOp, S2_DataSource,S2_Imm, S2_writeselect,S2_WriteEnable,reg_ReadData1, reg_ReadData2,ALUop,Datasource,S1_Imm,S1_WriteSelect,S1_WriteEnable,reset,clk );


//Decides between Immediate or RD2
Mux mux(Mux_out, S2_readData2, S2_Imm, S2_DataSource);

//decides what operation to do and outputs to stage 3
ALU alu(ALU_out, Mux_out, S2_readData1,S2_ALUOp);


// stage3 outputs ALU result, WS, and WE to reg.

stage3 stage_3(S3_out, S3_WriteSelect,S3_WriteEnable,S2_WriteEnable, S2_writeselect,ALU_out, clk, reset);

assign out = S3_out; 
endmodule
