`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:51:40 09/03/2014 
// Design Name: 
// Module Name:    conversor_BCD_7SEG 
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
module conversor_BCD_7SEG(cifraBCD, cod7SEG);
input [3:0] cifraBCD; 
 output [7:0] cod7SEG; 
 
 reg [7:0] cod7SEG; 
 
 // Segment # abc_defg hex equivalent 
 parameter APAGADO = 8'b111_11111; // h7F 
 parameter CERO = 8'b000_00011; // h01 
 parameter UNO = 8'b100_11111; // h4F 
 parameter DOS = 8'b001_00101; // h12 
 parameter TRES = 8'b000_01101; // h06 
 parameter CUATRO = 8'b100_11001; // h4C 
 parameter CINCO = 8'b010_01001; // h24 
 parameter SEIS = 8'b010_00001; // h20 
 parameter SIETE = 8'b000_11111; // h0F 
 parameter OCHO = 8'b000_00001; // h00 
 parameter NUEVE = 8'b000_01001; // h04 
 
 always @(cifraBCD) 
 case (cifraBCD) 
	 0: cod7SEG <= CERO; 
	 1: cod7SEG <= UNO; 
	 2: cod7SEG <= DOS; 
	 3: cod7SEG <= TRES; 
	 4: cod7SEG <= CUATRO; 
	 5: cod7SEG <= CINCO; 
	 6: cod7SEG <= SEIS; 
	 7: cod7SEG <= SIETE; 
	 8: cod7SEG <= OCHO; 
	 9: cod7SEG <= NUEVE; 
	 default: cod7SEG <= APAGADO; 
 endcase 
endmodule
