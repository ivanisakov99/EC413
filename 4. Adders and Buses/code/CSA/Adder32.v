`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2021 10:22:16 PM
// Design Name: 
// Module Name: Adder32
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

module Adder32(c_out, sum, a, b, c_in);
input [31:0] a;
input [31:0] b;
input c_in;
output c_out;
output [31:0] sum;

wire carry_out1;

Adder16 A1(carry_out1, sum[15:0], a[15:0], b[15:0], c_in);
Adder16 A2(c_out, sum[31:16], a[31:16], b[31:16], carry_out1);

endmodule