`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2021 10:22:16 PM
// Design Name: 
// Module Name: Adder16
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

module Adder16(c_out, sum, a, b, c_in);
input [15:0] a;
input [15:0] b;
input c_in;
output [15:0] sum;
output c_out;
    
wire carry_out1, carry_out2, carry_out3;

Adder4 A1 (carry_out1,sum[3:0], a[3:0], b[3:0], c_in);
Adder4 A2 (carry_out2,sum[7:4], a[7:4], b[7:4], carry_out1);
Adder4 A3 (carry_out3,sum[11:8], a[11:8], b[11:8], carry_out2);
Adder4 A4 (c_out,sum[15:12], a[15:12], b[15:12], carry_out3);

endmodule