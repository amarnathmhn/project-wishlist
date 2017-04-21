`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:05:40 04/21/2017 
// Design Name: 
// Module Name:    FpgaBot_top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module FpgaBot_top(
    input clk,
    output [1:0] leftMotor,
    output [1:0] rightMotor,
    output [1:0] motorEnable
    );

	assign leftMotor = 2'b00;
	assign rightMotor = 2'b00;
	
	localparam LEFT =0, RIGHT=1;
	reg [1:0]rst;
	
	MotorDriver#(.COUNTER_WIDTH(16)) LeftMotorDriver(.clk(clk),.rst(rst),.motor_inputs(leftMotor),.);

endmodule
