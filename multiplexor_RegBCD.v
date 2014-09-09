`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:23:17 09/03/2014 
// Design Name: 
// Module Name:    multiplexor_RegBCD 
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
module multiplexor_RegBCD(reg_cifrasBCD,reloj_1ms,cifraBCD,pantalla);
	parameter TAM_REG_BCD = `BUS_DAT+4;
	parameter CANT_PANTALLAS = (`BUS_DAT+4)/4;
	
	input [TAM_REG_BCD-1 : 0] reg_cifrasBCD;
	input reloj_1ms;
	output reg [3:0] cifraBCD;
	output [CANT_PANTALLAS-1:0] pantalla;
	
//	reg [TAM_REG_BCD-1 : 0] cifrasBCD;
	reg [CANT_PANTALLAS-1 : 0] pantalla_aux;
	
	initial pantalla_aux = {CANT_PANTALLAS{1'b1}} >> 1;//carga valor inicial 01111...111
//	initial cifrasBCD = reg_cifrasBCD;
	
	assign pantalla = pantalla_aux;
//	assign cifraBCD = cifrasBCD[3:0];
	//assign cifrasBCD = reg_cifrasBCD;
	
//	always@ (reg_cifrasBCD)
//	begin
//		cifrasBCD = reg_cifrasBCD;
//		pantalla_aux = {CANT_PANTALLAS{1'b1}} << 1;
//	end
	
//	reg i = TAM_REG_BCD;
	integer i = 0;
	
	always@ (posedge reloj_1ms)
	begin
//		pantalla <= pantalla_aux;
//		cifraBCD <= cifrasBCD[3:0];
//		if(reloj_1ms)
//		begin
		if(i >= (TAM_REG_BCD))
			i = 0;
		cifraBCD = (reg_cifrasBCD>>i);
		i = i+4;
		pantalla_aux = {pantalla_aux[CANT_PANTALLAS-2:0], pantalla_aux[CANT_PANTALLAS-1:CANT_PANTALLAS-1]};
		
//			pantalla_aux = {pantalla_aux[0:0], pantalla_aux[CANT_PANTALLAS-1:1]};
			//cifrasBCD = {cifrasBCD[TAM_REG_BCD-5:0], cifrasBCD[TAM_REG_BCD-1:TAM_REG_BCD-4]};
//		end
//		else//indudablemente si se activa el proceso y el pulso está en 0 implica que el reg_cifrasBCD cambió
//		begin
//			cifrasBCD <= reg_cifrasBCD;
//			pantalla_aux <= {CANT_PANTALLAS{1'b1}} << 1;
//		end
	end
	
//	always@ (reloj_1ms, reg_cifrasBCD)
//	begin
//	if(reloj_1ms == 1)
//		begin
//			pantalla = pantalla_aux;
//			cifraBCD = cifrasBCD[3:0];
//			pantalla_aux = {pantalla_aux[0:0], pantalla_aux[CANT_PANTALLAS-1:1]};
//			cifrasBCD = {cifrasBCD[TAM_REG_BCD-5:0], cifrasBCD[TAM_REG_BCD-1:TAM_REG_BCD-4]};
//		end
//	else if(reloj_1ms == 0)
//		begin
//		end
//		else
//			begin
//				cifrasBCD = reg_cifrasBCD;
//				pantalla_aux = {CANT_PANTALLAS{1'b1}} << 1;
//			end
//	end
	
//	function [TAM_REG_BCD-1:0] rotar_cifra;
//		input [TAM_REG_BCD-1:0] regBCDs;
//		rotar_cifra = {regBCDs[TAM_REG_BCD-5:0], regBCDs[TAM_REG_BCD-1:TAM_REG_BCD-4]};
//	endfunction
//		
//	function [CANT_PANTALLAS:0] rotar_pantalla;
//		input [CANT_PANTALLAS:0] pantalla_;
//		rotar_pantalla = {pantalla_[0:0], pantalla_[CANT_PANTALLAS-1:1]};
//	endfunction

endmodule