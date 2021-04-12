`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2021 09:36:01 PM
// Design Name: 
// Module Name: stage2
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


module stage2(S2_readData1,S2_readData2,S2_ALUOp, S2_DataSource,S2_Imm, S2_writeselect,S2_WriteEnable, 
					S1_readData1,S1_readData2, S1_ALUOp, S1_DataSource, S1_Imm, S1_writeselect, S1_WriteEnable, reset, clk);

input [31:0]S1_readData1, S1_readData2, S1_Imm;
input [4:0] S1_writeselect;
input [2:0] S1_ALUOp;
input  S1_DataSource, S1_WriteEnable, reset, clk; 

output reg[31:0] S2_readData1, S2_readData2;
output reg[15:0]S2_Imm;
output reg[4:0] S2_writeselect;
output reg[2:0] S2_ALUOp;
output reg S2_DataSource;
output reg S2_WriteEnable;

always@(posedge clk)
		begin
		if (reset)
			begin // if reset set to 0
			S2_readData1 <= 5'd0;
			S2_readData2 <= 5'd0;
			S2_writeselect <= 5'd0;
			S2_WriteEnable <= 1'b0;
			S2_Imm <= 16'b0;
			S2_DataSource <= 1'b0;
			S2_ALUOp <= 3'b0;
			
			
			
			
			end
		else
			begin // set output of stage 2 to equal output of stage 1
			S2_readData1 <= S1_readData1;
			S2_readData2 <= S1_readData2;
			S2_writeselect <= S1_writeselect;
			S2_WriteEnable <= 1'b1;
			S2_Imm <= S1_Imm;
			S2_DataSource <=S1_DataSource;
			S2_ALUOp <= S1_ALUOp;
			
			
			
			end
		end

endmodule
