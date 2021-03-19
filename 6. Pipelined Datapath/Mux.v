`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2021 09:36:01 PM
// Design Name: 
// Module Name: Mux
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


module Mux(Out, S2_ReadData2, S2_Imm, S2_DataSource);

input [31:0] S2_ReadData2;
input [15:0]S2_Imm;
input  S2_DataSource;

output [31:0] Out;


wire[31:0]Extension;

assign Extension= {{16{0}}, S2_Imm}; // extends immediate to 32 bit. 
assign Out =(S2_DataSource) ? Extension : S2_ReadData2; // choose which one. immediate or RD2




endmodule
