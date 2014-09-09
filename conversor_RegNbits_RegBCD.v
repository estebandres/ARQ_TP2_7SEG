`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:15:45 09/03/2014 
// Design Name: 
// Module Name:    conversor_REGbits_reg_BCD 
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
module conversor_RegNbits_RegBCD(reg_binario,reg_BCD);//convierte un registro binario en un registro de cifras BCD
//module conversor_RegNbits_RegBCD(reg_binario, habilitado,reg_BCD);//convierte un registro binario en un registro de cifras BCD
	parameter TAM_REG_BIN = `BUS_DAT;
	input reg_binario;
// input reg_binario, habilitado;	
	output reg_BCD; 
//	wire habilitado; 
	wire [TAM_REG_BIN-1 : 0] reg_binario; 
	reg [TAM_REG_BIN-1 : 0] bin; 
	reg [TAM_REG_BIN+3 : 0] reg_BCD; 
	reg [TAM_REG_BIN+3: 0] resultado; 
//	always@( reg_binario or habilitado )
	always@( reg_binario) 
	begin 
		bin = reg_binario; 
		resultado = 0; 
//		if ( habilitado == 0 ) 
//			reg_BCD <= 0; 
//		else
//		begin 
	 
			repeat ( TAM_REG_BIN-1 ) 
			 
			begin 
			 
				resultado[0] = bin[TAM_REG_BIN-1]; 

				if ( resultado[3 : 0] > 4 ) 
				resultado[3 : 0] = resultado[3 : 0] + 4'd3; 

				if ( resultado[7 : 4] > 4 ) 
				resultado[7 : 4] = resultado[7 : 4] + 4'd3; 

				if ( resultado[11 : 8] > 4 ) 
				resultado[11 : 8] = resultado[11 : 8] + 4'd3; 

				resultado = resultado << 1; 

				bin = bin << 1; 

			end 

		resultado[0] = bin[TAM_REG_BIN-1]; 

		reg_BCD <= resultado; 

//		end 

	end
 
endmodule
