`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:09:01 09/03/2014 
// Design Name: 
// Module Name:    monitor_decimal 
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
//`include "definiciones.vh"
//module monitor_decimal(switches, boton_placa, clock_placa, reg7SEG, sel_pantalla);
module monitor_decimal(switches, clock_placa, reg7SEG, sel_pantalla);
	parameter CANT_BITS = 8;
	
	parameter CANT_CIFRAS_BCD = CANT_BITS+4;
	parameter CANT_PANTALLAS = (CANT_BITS+4)/4;
	
	input [CANT_BITS-1:0] switches;
//	input boton_placa;
	input clock_placa;
	output [7:0] reg7SEG;
	output [CANT_PANTALLAS-1:0] sel_pantalla;
	
//	wire [CANT_BITS-1:0] reg_N_bits;
	wire [CANT_BITS+3:0]reg_cifras_BCD;
	wire pulso_1ms;
	wire [3:0] cable_cifra_BCD;
	
//	cargador_N_bits #(CANT_BITS) cargador(.entrada(switches),
//											.boton(boton_placa),
//											.nro_N_bits(reg_N_bits));
										
	conversor_RegNbits_RegBCD #(CANT_BITS) conv_Bin_BCD(.reg_binario(switches),
															  .reg_BCD(reg_cifras_BCD));
														  
	reloj_ms #(1) reloj_1ms (.clock_FPGA(clock_placa),
									 .reloj_N_ms(pulso_1ms));

	multiplexor_RegBCD #(CANT_CIFRAS_BCD,CANT_PANTALLAS) mux (.reg_cifrasBCD(reg_cifras_BCD),
																		 .reloj_1ms(pulso_1ms),
																		 .cifraBCD(cable_cifra_BCD),
																		 .pantalla(sel_pantalla));
								  
	conversor_BCD_7SEG conv_7seg (.cifraBCD(cable_cifra_BCD), 
									      .cod7SEG(reg7SEG));


endmodule
