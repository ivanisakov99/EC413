`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2021 04:57:04 PM
// Design Name: 
// Module Name: addermux
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


module addermux(c_out, adder_out, sub_out, select);
input adder_out, sub_out; 
input select;
output reg c_out;

always @(*)
begin
case(select)
1'b0: c_out = adder_out;
1'b1: c_out = sub_out;
default:c_out = 0;
endcase
end

endmodule