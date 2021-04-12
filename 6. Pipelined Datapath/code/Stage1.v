`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2021 09:36:01 PM
// Design Name: 
// Module Name: Stage1
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


module Stage1(S1_ReadSelect1, S1_ReadSelect2, S1_Imm,S1_WriteSelect, ALUop, Datasource, S1_WriteEnable,InstrIn,clk,reset);

input [31:0] InstrIn;
input clk, reset;
output reg[31:0] S1_ReadSelect1, S1_ReadSelect2;
output reg [15:0] S1_Imm;
output reg[4:0] S1_WriteSelect;
output reg[2:0] ALUop;
output reg Datasource;
output reg S1_WriteEnable;

always@(posedge clk)
		begin
		if (reset) // if reset reset values to 0
			begin
			S1_ReadSelect1 <= 5'd0;
			S1_ReadSelect2 <= 5'd0;
			S1_WriteSelect <= 5'd0;
			S1_WriteEnable <= 1'b0;
			S1_Imm <= 16'b0;
			Datasource <= 1'b0;
			ALUop <= 3'b0;
			
			
			
			
			end
		else
			begin // separate values from InstrIn to appropriate variables.
			S1_ReadSelect1 <= InstrIn[20:16];// which reg
			S1_ReadSelect2 <= InstrIn[15:11];//which reg
			S1_WriteSelect <= InstrIn[25:21];
			S1_WriteEnable <= 1'b1; // always 1
			S1_Imm <= InstrIn[15:0]; //immediate
			Datasource <=InstrIn[29];// tell which type I or R
			ALUop <= InstrIn[28:26];// which operation
			
			
			
			end
		end

endmodule
