`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:32:48 09/12/2014
// Design Name:   monitor_decimal
// Module Name:   /home/steve07-ultra/Proyectos_ISE/TP2_7SEG/monitor_decimal_tb.v
// Project Name:  TP2_7SEG
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: monitor_decimal
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module monitor_decimal_tb;

	// Inputs
	reg [7:0] switches;
	reg clock_placa;

	// Outputs
	wire [7:0] reg7SEG;
	wire [2:0] sel_pantalla;

	// Instantiate the Unit Under Test (UUT)
	monitor_decimal #(8) uut (
		.switches(switches), 
		.clock_placa(clock_placa), 
		.reg7SEG(reg7SEG), 
		.sel_pantalla(sel_pantalla)
	);

	initial begin
		// Initialize Inputs
		switches = 0;
		clock_placa = 0;
		#200
		switches = 8'b11111110;
		#200
		switches = 8'b10000000;
		#200
		switches = 8'b01100010;
	end
	always  
	begin
		#2  clock_placa =  ! clock_placa; 
   end   
      
//    initial 
//     #400  $finish;
      
endmodule

