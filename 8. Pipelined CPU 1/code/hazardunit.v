

module hazardunit(IFIDWrite, PCWrite, HazardMux, 
                    IDEX_rd, IFID_rs, IFID_rt, 
                    EXMEM_rd, RegWEX, RegWMEM);

	output reg IFIDWrite, PCWrite, HazardMux;
	input [4:0] IDEX_rd, IFID_rs, IFID_rt, EXMEM_rd;
	input RegWEX, RegWMEM;
	
	always@(*)
	begin
	
	if(RegWEX && (IDEX_rd == IFID_rs || IDEX_rd == IFID_rt) && IDEX_rd != 0)      // 1-Ahead
	begin
	   IFIDWrite = 0;
	   PCWrite = 0;
	   HazardMux = 1;
	end

	else if(RegWMEM && (EXMEM_rd == IFID_rs || EXMEM_rd == IFID_rt) && EXMEM_rd != 0)     // 2-Ahead
	begin
	   IFIDWrite = 0;
	   PCWrite = 0;
	   HazardMux = 1;
	end
	else
	begin
	   IFIDWrite = 1;
	   PCWrite = 1;
	   HazardMux = 0;
	end
	
	end

endmodule