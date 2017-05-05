`timescale 1ns / 1ps
module B_mem(output out_elements, output finish, input clk, input readMem, input row_num);
	parameter A_mem_height = 64;
	parameter element_width = 32;
	wire clk, readMem;
	reg [element_width -1:0] out_element;
	reg [element_width - 1:0] B [0: A_mem_height -1];
	reg finish = 0;
	integer row_num;
	initial
		begin
			$readmemh("B_mem.txt", B);
		end
		
	integer i;
	always @(readMem)
		begin
			if(readMem)	
				begin
					out_elements[element_width -1:0] = B[row_num];
				end
				finish = 1;
		end
	
	
endmodule
