`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2021 10:22:16 PM
// Design Name: 
// Module Name: Adder64
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

module Adder64(c_out, sum, a, b, c_in);
input [63:0] a;
input [63:0] b;
input c_in;
output [63:0] sum;
output c_out;
    
wire carry_out1, carry_out2, carry_out3;

Adder16 A1(carry_out1,sum[15:0], a[15:0], b[15:0], c_in);
Adder16 A2(carry_out2,sum[31:16], a[31:16], b[31:16], carry_out1);
Adder16 A3(carry_out3,sum[47:32], a[47:32], b[47:32], carry_out2);
Adder16 A4(c_out,sum[63:48], a[63:48], b[63:48], carry_out3);

endmodule