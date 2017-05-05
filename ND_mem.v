`timescale 1ns / 1ps
// This memory for the non-diagonal elements in A matrix.
// for the first and the last rows there are two elements.
// Otherwise, there are three elements.
module ND_mem(output out_elements, output finish, input clk, input readMem, input row_num);
	parameter no_of_non_diagonals = 2;
	parameter A_mem_height = 64;
	parameter element_width = 32;
	wire clk, readMem;
	reg finish = 0;
	reg [element_width*no_of_non_diagonals - 1: 0] out_elements;
	reg [element_width*no_of_non_diagonals - 1: 0] ND_mem [0:A_mem_height -1];
	
	initial
		begin
			$readmemh("ND_mem.txt", ND_mem);
		end
	
	always @(readMem)
		begin
			if(readMem)	
				for(i = 0; i < no_of_non_diagonals; i = i+1) begin
					out_elements[element_width *i + 31 : element_width*i] = ND_mem[element_width *i + 31 : element_width*i][row_num];
				end
				finish = 1;
		end
		
endmodule
