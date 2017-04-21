`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:07:21 04/21/2017 
// Design Name: 
// Module Name:    MotorDriver 
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
module MotorDriver #(parameter COUNTER_WIDTH=16)(
    input clk,
    input rst,
    input  dir, // decides direction of rotation
	 input [COUNTER_WIDTH-1:0]speed, // decides speed of rotation
	 // These outputs go directly to the H-bridge
	 output [1:0] motor_inputs,   
	 output pwm_en
    );
	 
	 PwmGen #(.COUNTER_WIDTH(COUNTER_WIDTH) )pwmGen(.clk(clk),.rst(rst), .CYCLES_IN_1MS(50000), .pwm_i(speed), .pwm_o(pwm_en) );
		
	 // if dir == 0, then motor_inputs = 0,1
	 // if dir == 1, then motor_inputs = 1,0
	 assign motor_inputs = 1 << dir ;
	  
	

endmodule
