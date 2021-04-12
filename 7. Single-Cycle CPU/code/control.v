`timescale 1ns / 1ns

module control(
		input [5:0] instruction,
		input [5:0] func,
		output reg [2:0] ALUOp,
		output reg MemRead,
		output reg MemtoReg,
		output reg RegDst,
		output reg Branch,
		output reg BNE, 
		output reg Jump,
		output reg JR,
		output reg ALUSrc,
		output reg MemWrite,
		output reg RegWrite,
		output reg LUI
		);


always @(*) begin
		if ((instruction == 6'b00_0000) && (func != 6'b00_1000)) begin				//RType
		ALUOp = 3'b000;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		RegDst = 1'b1;
        Branch = 1'b0;
        BNE = 1'b0;
        Jump = 1'b0;
        JR = 1'b0;		
	    ALUSrc = 1'b0;
		MemWrite = 1'b0;
		RegWrite = 1'b1;
		LUI = 1'b0;
		end 
		else if (instruction == 6'b00_0100) begin   //branch
		ALUOp = 3'b001;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		RegDst = 1'b0;
        Branch = 1'b1;
        BNE = 1'b0;
        Jump = 1'b0;
        JR = 1'b0;		
	    ALUSrc = 1'b0;
		MemWrite = 1'b0;
		RegWrite = 1'b0;
		LUI = 1'b0;
		end 
		else if (instruction == 6'b10_1011) begin   // SW
		ALUOp = 3'b010;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		RegDst = 1'b0;
        Branch = 1'b0;
        BNE = 1'b0;
        Jump = 1'b0;
        JR = 1'b0;		
	    ALUSrc = 1'b1;
		MemWrite = 1'b1;
		RegWrite = 1'b0;
		LUI = 1'b0;
		end 
		else if (instruction == 6'b10_0011) begin   // LW
		ALUOp = 3'b010;
		MemRead = 1'b1;
		MemtoReg = 1'b1;
		RegDst = 1'b0;
        Branch = 1'b0;
        BNE = 1'b0;
        Jump = 1'b0;
        JR = 1'b0;		
	    ALUSrc = 1'b1;
		MemWrite = 1'b0;
		RegWrite = 1'b1;
		LUI = 1'b0;
		end 
		else if(instruction == 6'b00_1000) begin  //ADDI
		ALUOp = 3'b011;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		RegDst = 1'b0;
        Branch = 1'b0;
        BNE = 1'b0;
        Jump = 1'b0;
        JR = 1'b0;		
	    ALUSrc = 1'b1;
		MemWrite = 1'b0;
		RegWrite = 1'b1;
		LUI = 1'b0;
		end
		else if(instruction == 6'b00_1100) begin  //ANDI
		ALUOp = 3'b100;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		RegDst = 1'b0;
        Branch = 1'b0;
        BNE = 1'b0;
        Jump = 1'b0;
        JR = 1'b0;		
	    ALUSrc = 1'b1;
		MemWrite = 1'b0;
		RegWrite = 1'b1;
		LUI = 1'b0;
		end
		else if(instruction == 6'b00_1101) begin  //ORI
		ALUOp = 3'b101;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		RegDst = 1'b0;
        Branch = 1'b0;
        BNE = 1'b0;
        Jump = 1'b0;
        JR = 1'b0;		
	    ALUSrc = 1'b1;
		MemWrite = 1'b0;
		RegWrite = 1'b1;
		LUI = 1'b0;
		end
		else if(instruction == 6'b00_0001) begin  //SUBI
		ALUOp = 3'b110;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		RegDst = 1'b0;
        Branch = 1'b0;
        BNE = 1'b0;
        Jump = 1'b0;
        JR = 1'b0;		
	    ALUSrc = 1'b1;
		MemWrite = 1'b0;
		RegWrite = 1'b1;
		LUI = 1'b0;
		end
		else if(instruction == 6'b00_1010) begin  //SLTI
		ALUOp = 3'b111;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		RegDst = 1'b0;
        Branch = 1'b0;
        BNE = 1'b0;
        Jump = 1'b0;
        JR = 1'b0;		
	    ALUSrc = 1'b1;
		MemWrite = 1'b0;
		RegWrite = 1'b1;
		LUI = 1'b0;
		end
		else if(instruction == 6'b00_0010) begin  //J
		ALUOp = 3'b000;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		RegDst = 1'b0;
        Branch = 1'b0;
        BNE = 1'b0;
        Jump = 1'b1;
        JR = 1'b0;		
	    ALUSrc = 1'b0;
		MemWrite = 1'b0;
		RegWrite = 1'b0;
		LUI = 1'b0;
		end
		else if((instruction == 6'b00_0000) && (func == 6'b00_1000)) begin    //JR
		ALUOp = 3'b000;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		RegDst = 1'b0;
        Branch = 1'b0;
        BNE = 1'b0;
        Jump = 1'b0;
        JR = 1'b1;		
	    ALUSrc = 1'b0;
		MemWrite = 1'b0;
		RegWrite = 1'b0;
		LUI = 1'b0;
		end
		else if(instruction == 6'b00_0011) begin  //BNE
		ALUOp = 3'b001;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		RegDst = 1'b0;
        Branch = 1'b0;
        BNE = 1'b1;
        Jump = 1'b0;
        JR = 1'b0;		
	    ALUSrc = 1'b0;
		MemWrite = 1'b0;
		RegWrite = 1'b0;
		LUI = 1'b0;
		end
		else if(instruction == 6'b00_1111) begin  //LUI
		ALUOp = 3'b010;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		RegDst = 1'b0;
        Branch = 1'b0;
        BNE = 1'b0;
        Jump = 1'b0;
        JR = 1'b0;		
	    ALUSrc = 1'b1;
		MemWrite = 1'b0;
		RegWrite = 1'b1;
		LUI = 1'b1;
		end
		else begin
		ALUOp = 2'b00;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		RegDst = 1'b0;
        Branch = 1'b0;
        BNE = 1'b0;
        Jump = 1'b0;
        JR = 1'b0;		
	    ALUSrc = 1'b0;
		MemWrite = 1'b0;
		RegWrite = 1'b0;
		end
	
	
end
endmodule
