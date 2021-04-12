`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2021 05:01:36 PM
// Design Name: 
// Module Name: topnbit_verification
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


module topnbit_verification(result, clk, c_in,a, b, ALOP);

	parameter W = 32;
	input [2:0] ALOP;
	input clk;
	input [W-1:0] a, b;
	input c_in;
	output [W:0] result;

	
	wire [W-1:0] sum_to_reg;
	
	assign { result} = //verifies each function 
	(ALOP == 3'b000) ? {a}:
	(ALOP == 3'b001) ? {~a}:
	(ALOP == 3'b011) ? {a&b}:
	(ALOP == 3'b100) ? {a|b}:
	(ALOP == 3'b101) ? {a-b}:
	(ALOP == 3'b110) ? a+b+c_in:
	0;
	
endmodule

