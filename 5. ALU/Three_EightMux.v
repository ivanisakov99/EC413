`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2021 04:57:57 PM
// Design Name: 
// Module Name: Three_EightMux
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


module Three_EightMux(out1, mov_out, Not_out, add_out,sub_out,or_out,and_out,select);
input mov_out, Not_out, add_out,sub_out,or_out,and_out;
input [2:0]select;
output reg out1;




always@(*)
begin
case(select)

3'b000: out1 = mov_out;  
3'b001: out1 = Not_out;
3'b011: out1 = and_out;
3'b100: out1 = or_out;
3'b101: out1 = sub_out;
3'b110: out1 = add_out;
default: out1 = 0;

endcase
end

endmodule
