`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2021 04:52:41 PM
// Design Name: 
// Module Name: Register
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


module Register(output [W-1:0] reg_out, input clk,input [W-1:0] reg_in);

	parameter W = 32;

	reg [W-1:0] Reg;

	assign reg_out = Reg; // puts value into register

	always@(posedge clk) // runs the clock.
		begin
		Reg <= reg_in;
		end
		
endmodule
