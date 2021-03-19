`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2021 09:36:01 PM
// Design Name: 
// Module Name: stage3
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


module stage3(out, S3_WriteSelect, S3_WriteEnable,S2_WriteEnable, S2_WriteSelect, ALU_in,clk, reset);
input [31:0]ALU_in;
input [4:0] S2_WriteSelect;
input reset, clk, S2_WriteEnable;

output reg[31:0] out;
output reg[4:0] S3_WriteSelect;
output reg S3_WriteEnable;

always @(posedge clk)
begin
	if(reset) // if reset set values to 0
		begin
		S3_WriteSelect <= 5'b0;
		S3_WriteEnable <= 1'b0;
		out <= 32'b0;
		end
	else
		begin // set output of stage 3 to output of stage 2.
		S3_WriteSelect <= S2_WriteSelect;
		S3_WriteEnable <= S2_WriteEnable;
		out <= ALU_in;
		end
end

endmodule
