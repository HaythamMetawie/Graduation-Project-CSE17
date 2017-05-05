`timescale 1ns / 1ps
// In this memory, we will store the diagonal elements.
module A_diagonal_mem(output out_elements, output finish, input clk, input readMem, input row_num);
	parameter A_mem_height = 64;
	parameter element_width = 32;
	wire clk, readMem;
	wire column_number;
	reg [element_width - 1:0] out_elements;
	reg [element_width - 1:0] A_Diagonal [0: A_mem_height - 1];
	reg finish  = 0;
	
	initial
		begin
			$readmemh("A_diagonal_mem.txt", A_Diagonal);
		end
		
	integer i;
	always @(readMem)
		begin
			if(readMem)	
				begin
					out_elements[element_width - 1 : 0] = A[row_num];
				end
				finish = 1;
		end
	

endmodule
