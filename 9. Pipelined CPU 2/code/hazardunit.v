module hazardunit(IFIDWrite, PCWrite, HazardMux, IDEX_rt, IFID_rs, IFID_rt, memread);

	output 	IFIDWrite, PCWrite, HazardMux;
	input [4:0] IDEX_rt,IFID_rs,IFID_rt;
	input memread;
	

	assign IFIDWrite = (memread && (IDEX_rt == IFID_rs || IDEX_rt == IFID_rt)) ? 0 : 1;
	assign PCWrite = (memread && (IDEX_rt == IFID_rs || IDEX_rt == IFID_rt)) ? 0 : 1;
	assign HazardMux = (memread && (IDEX_rt == IFID_rs || IDEX_rt == IFID_rt)) ? 1 : 0;

endmodule