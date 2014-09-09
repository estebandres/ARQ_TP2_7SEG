`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:58:04 09/03/2014 
// Design Name: 
// Module Name:    cargador_8bits 
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
module cargador_N_bits(entrada,boton,nro_N_bits);
	parameter CANT_BITS = `BUS_DAT;
	input [CANT_BITS-1:0] entrada;
	input boton;
	output reg [CANT_BITS-1:0] nro_N_bits;
	 
	always @(boton)
		begin			
			if(boton)
			begin
				nro_N_bits = entrada;
			end
		end

endmodule