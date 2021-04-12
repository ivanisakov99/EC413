`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2021 06:42:45 PM
// Design Name: 
// Module Name: forwardmux
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


module forwardmux(fA, fB, EX_MEM_Rd, MEM_WB_Rd, ID_EX_Rs, ID_EX_Rt, EX_MEM_RegWrite, EX_MEM_MemWrite, MEM_WB_RegWrite);
    input [4:0] EX_MEM_Rd, MEM_WB_Rd, ID_EX_Rs, ID_EX_Rt;
    input EX_MEM_RegWrite, MEM_WB_RegWrite, EX_MEM_MemWrite;
    output [1:0] fA,fB;
    
    assign fA = (EX_MEM_RegWrite && (EX_MEM_Rd == ID_EX_Rs)) ? 2'b10 : (MEM_WB_RegWrite && (MEM_WB_Rd == ID_EX_Rs)) ? 2'b01 : 2'b00;
    
    assign fB = ((EX_MEM_MemWrite || EX_MEM_RegWrite) && (EX_MEM_Rd == ID_EX_Rt)) ? 2'b10 : (MEM_WB_RegWrite && (MEM_WB_Rd == ID_EX_Rt)) ? 2'b01 : 2'b00;
    
endmodule
