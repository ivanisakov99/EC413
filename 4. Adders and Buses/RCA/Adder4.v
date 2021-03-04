`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2021 10:22:16 PM
// Design Name: 
// Module Name: Adder4
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

module Adder4(c_out, sum, a, b, c_in);

input	 [3:0] a; //declare input a, 4 bits
input  [3:0] b; //declare input b, 4 bits
input  c_in; //declare input c_in, 1 bit
output c_out; //delcare output c_out, 1 bit
output [3:0] sum; //declare output sum, 4 bits

wire	 fa1_cout, fa2_cout, fa3_cout; //declare wires for each values being passed between each full adder

//call 4 1 bit adders to compute 4 bit sum
FA_str FA1(fa1_cout, sum[0], a[0], b[0], c_in);
FA_str FA2(fa2_cout, sum[1], a[1], b[1], fa1_cout);
FA_str FA3(fa3_cout, sum[2], a[2], b[2], fa2_cout);
FA_str FA4(c_out, sum[3], a[3], b[3], fa3_cout);



endmodule