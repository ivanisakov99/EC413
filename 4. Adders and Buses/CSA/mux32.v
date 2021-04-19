`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2021 10:22:16 PM
// Design Name: 
// Module Name: mux32
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

module mux32(carry, sum, select, a,b, carry_out1, carry_out2);
input select;
input [31:0] a;
input [31:0] b;
input carry_out1, carry_out2;
output carry;
output [31:0]sum;

assign carry = select ? carry_out2: carry_out1;
assign sum = select ? b : a;

endmodule