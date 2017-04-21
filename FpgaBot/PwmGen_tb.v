`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:36:52 04/21/2017
// Design Name:   PwmGen
// Module Name:   /home/amarnath/wishlist/FpgaBot/PwmGen_tb.v
// Project Name:  FpgaBot
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PwmGen
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/1ns
module PwmGen_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [15:0] CYCLES_IN_1MS;
	reg [15:0] pwm_i;

	// Outputs
	wire pwm_o;
	wire [15:0]counter;
	// Instantiate the Unit Under Test (UUT)
	PwmGen uut (
		.clk(clk), 
		.rst(rst), 
		.CYCLES_IN_1MS(CYCLES_IN_1MS), 
		.pwm_i(pwm_i), 
		.pwm_o(pwm_o)
	);
	
	assign counter = uut.counter;

	// generate 50 MHz clock
	always #10 clk = ~clk;
	
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		CYCLES_IN_1MS = 50000;
		pwm_i = 20000;
		#10;
		rst = 0;
		#10;
		rst = 1;
		// Wait 100 ns for global reset to finish
		#1000000;
        
		// Add stimulus here

	end
      
endmodule

