`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:10:15 04/21/2017 
// Design Name: 
// Module Name:    PwmGen 
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
/*
 Module that generates a PWM signal output for clock frequency 1 KHz
 Input Clock clkis 50 MHz for the Mojo FPGA. i.e. There are 50,000 cycles in 1 ms.
 Reset rst is active low.
 pwm_i indicates the number of cycles between 0 and 50,000 for which 
 the pwm_o should remain high and low for remaining cycles
*/ 
module PwmGen #(parameter COUNTER_WIDTH = 16)(
    input clk,
    input rst,
	 input[COUNTER_WIDTH-1:0] CYCLES_IN_1MS,
    input[COUNTER_WIDTH-1:0] pwm_i,
    output pwm_o
    );

	reg pwm_reg;
	assign pwm_o = pwm_reg;
	reg[COUNTER_WIDTH-1:0] counter = 0;
	always@(posedge clk or negedge rst)begin
		if(!rst) begin
			counter <= 0;
			pwm_reg <= 0;
		end
		else begin
			if(counter <= CYCLES_IN_1MS - pwm_i)begin
				counter <= counter + 1;
				pwm_reg <= 0;
			end
			else if(counter <= CYCLES_IN_1MS)begin
				pwm_reg <= 1;
				counter <= counter +1;
			end
			else begin
				counter <= 0;
				pwm_reg <= 0;
			end
			
		end
	end

endmodule
