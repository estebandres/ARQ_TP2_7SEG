`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:55:32 09/03/2014 
// Design Name: 
// Module Name:    reloj_ms 
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
`include "definiciones.vh"
module reloj_ms(clock_FPGA, reloj_N_ms);
	parameter CANT_MS = 1;
	
	input clock_FPGA;
	output reg reloj_N_ms;
	
	reg [14:0] contador;
	initial contador = 0;
	initial reloj_N_ms = 0;
	
	always@ (posedge clock_FPGA)
	begin
		if (contador >= CANT_MS*5)
		begin
			contador = 0;
			reloj_N_ms = ~reloj_N_ms;
		end
		else 
			contador = contador +1;
	end


endmodule
