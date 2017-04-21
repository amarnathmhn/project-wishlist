`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:29:42 04/21/2017
// Design Name:   MotorDriver
// Module Name:   /home/amarnath/wishlist/FpgaBot/MotorDriver_tb.v
// Project Name:  FpgaBot
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MotorDriver
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MotorDriver_tb;

	// Inputs
	reg clk;
	reg rst;
	reg dir;
	reg [15:0] speed;

	// Outputs
	wire [1:0] motor_inputs;
	wire pwm_en;

	// Instantiate the Unit Under Test (UUT)
	MotorDriver uut (
		.clk(clk), 
		.rst(rst), 
		.dir(dir), 
		.speed(speed), 
		.motor_inputs(motor_inputs), 
		.pwm_en(pwm_en)
	);
  always #10 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		dir = 0;
		speed = 20000;
		#10 rst = 0;
		#10 rst = 1;
		// Wait 100 ns for global reset to finish
		#100;
      dir = 1;
		#1000000;
		// Add stimulus here

	end
      
endmodule

