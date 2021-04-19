`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2021 10:28:58 PM
// Design Name: 
// Module Name: CSA_tb
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

module CSA_tb;

	// Inputs
	reg [63:0] a;
	reg [63:0] b;
	reg c_in;
	reg clk;

	// Outputs
	wire c_out;
	wire [63:0] sum;
	wire error_flag;
	wire c_out_verify;
	wire [63:0] sum_verify;

	// Instantiate the Unit Under Test (UUT)
	CSA uut (
		.c_out(c_out), 
		.sum(sum), 
		.a(a), 
		.b(b), 
		.c_in(c_in)
	);
// Verification module
	CSA_Verification Verification (
		.c_out(c_out_verify), 
		.sum(sum_verify), 
		.a(a), 
		.b(b), 
		.c_in(c_in)
	);
	

	// Assign Error Flag
	assign error_flag = ((c_out != c_out_verify) || (sum != sum_verify));

	// Derfine clk signal for both Verfication and Input signal generation	
	always #5 clk = ~clk;

	// Verification logic
	always@(posedge clk)
		begin
		if (error_flag == 1'b1)
			begin
			$display("Error occurs when a = %d, b = %d, c_in = %d\n", a, b, c_in);
			end
		end
		
	initial begin
		// Initialize Inputs
		clk = 1'b0;
		
		a = 64'h0;
		b = 64'h0;
		c_in = 1'd0;
		
		// Wait 150 ns
		#150;
		a = 64'hffffffffffffffff;
		b = 64'h0;
		c_in = 1'd1;
		
		// Wait 150 ns
		#150;
		a = 64'hffffffffffffffff;
		b = 64'hffffffffffffffff;
		c_in = 1'd1;
		
		// Wait 150 ns
		#150;
		a = 64'hffffffffffffffff;
		b = 64'h0;
		c_in = 1'd0;
		
		// Wait 150 ns
		#150;
		a = 64'hffffffffffffffff;
		b = 64'hffffffffffffffff;
		c_in = 1'd0;
		
		// Wait 150 ns
		#150;
		a = 64'h00000000000000ff;
		b = 64'h00000000000000ff;
		c_in = 1'd0;
		
		// Wait 150 ns
		#150;
		a = 64'h00000000000000ff;
		b = 64'h00000000000000ff;
		c_in = 1'd1;

		  

	end
         
endmodule
