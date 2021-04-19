`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2021 10:28:58 PM
// Design Name: 
// Module Name: Adder64_Verification
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

module Adder64_Verification(c_out, sum, a, b, c_in);

	input [63:0]	 a, b; //declare inputs a, b, and c_in, one bit each
	input c_in;
	output c_out;
	output [63:0] sum; //declare outputs c_out and sum, one bit each
    
	assign {c_out, sum} = a + b + c_in;

endmodule
