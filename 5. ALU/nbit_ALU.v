`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2021 04:52:41 PM
// Design Name: 
// Module Name: nbit_ALU
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


module nbit_ALU(result,a,b,c_in,ALOP);

parameter W = 32;

input [W-1:0] a, b; // set the parameter to W-1
input [2:0]ALOP;
input c_in;
output [W-1:0] result;


wire [W:0] carry;

assign carry[0] = c_in;


genvar i;
generate
	for(i = 0; i < W; i = i + 1) 
		begin: alu
		Onebit_ALU alu(carry[i+1], result[i], a[i], b[i], carry[i], ALOP[2:0]); // generates W bit alu from 1 bit alu
																				// takes the carry out from last to the carry in of the next
		end

endgenerate

endmodule
