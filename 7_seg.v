`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:06:30 08/22/2014 
// Design Name: 
// Module Name:    ALU 
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
`define BUS 8 				//ancho del bus de datos 
`define BUS_MAX `BUS-1 	//ancho del bus de datos MENOS UNO
`define OP 6 				//cantidad de bits de operaciones
`define OP_MAX `OP-1 	//cantidad MENOS UNO de bits de operaciones

module converosr_bin_bcd(clock, num_bin, display, entero_BCD); 
	input [`BUS_MAX:0] num_bin; 
	output [3:0] display; //Selecciona el display que se va a encender.
	output [7:0] entero_BCD; //Es el digito que se va a mostrar en el display encendido.
	
	reg [3:0] unidad, decena, centena, unidad_mil;
	reg [28:0] contador; //Es el contador del clock.
	reg [1:0] contador2; //Cuenta el display a encender.

	reg [23:0] shift;
	integer i;
	always@ (num_bin)
	begin
//Convertir el binario a codigo bcd, guardandolo en 4 registros. Esto se va a hacer solo cuando se cambia algun switch, se podria poner que lo haga cuando se aptrieta un boton.
		shift[23:8] = 0;
		shift[7:0] = num_bin;
	
		for (i=0; i<BUS; i=i+1) begin
        		 if (shift[11:8] >= 5)
            			shift[11:8] = shift[11:8] + 3;

        		 if (shift[15:12] >= 5)
           		 	shift[15:12] = shift[15:12] + 3;

        		 if (shift[19:16] >= 5)
            			shift[19:16] = shift[19:16] + 3;

			if (shift[23:20] >= 5)
				shift[23:20] = shift[23:20] +3;

         		// Shift entire register left once
         		shift = shift << 1; //Shift aritmetico a izquierda, rellena con cero en LSB, y el MSB va al carry (Mantiene el signo)
		end //del for
		
		unidad_mil = shift[23:20];
		centena	= shift[19:16];
      		decena = shift[15:12];
      		unidad = shift[11:8];

	end

	always@ (posedge clock)
	begin
		if (contador == 50000000) //Cuando llega a 50M paso un segundo. Bajar el 50M al un valor que no parpadeen los displays.
			contador = 0;
			if ( contador2 == 3) //Resetea contador2, es decir, vuelve al primer display.
				contador2 = 0;
			else 
				contador2 = contador2 + 1; //Cambia de display.
			end if
		else 
			contador = contador +1;
		end if
	end

	always@ (contador2)
	begin
		case (contador2)
			0: display = 4'b1110;
			   entero_BCD = tabla_BCD (unidad);	
			1: display = 4'b1101;
			   entero_BCD = tabla_BCD (decena);	
			2: display = 4'b1011;
			   entero_BCD = tabla_BCD (centena);	
			3: display = 4'b0111;
			   entero_BCD = tabla_BCD (unidad_mil);	
			default:
		endcase
	end

function [7:0] tabla_BCD; 
	input [3:0] entero;  //Este tiene enteros de 0 a 9 por eso son 4 bits.
	case ( entero ) 
		1: tabla_BCD = 8'b ;
		2: tabla_BCD = 8'b ;
		3: tabla_BCD = 8'b ;
		4: tabla_BCD = 8'b ;
		5: tabla_BCD = 8'b ;
		6: tabla_BCD = 8'b ;
		7: tabla_BCD = 8'b ;
		8: tabla_BCD = 8'b ;
		9: tabla_BCD = 8'b ;
		0: tabla_BCD = 8'b ;
		default : begin 
			tabla_BCD = 8'b11111111; //Apaga todo 
			$display("Numero no existente!!"); 
		end
	endcase
endfunction

endmodule
