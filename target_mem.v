`timescale 1ns / 1ps
module target_mem(output out_elements, output finish, input clk, input readMem, input in_data, input row_num);
	parameter no_of_elements = 16;
	parameter x_mem_height = 64;
	parameter element_width = 32;
	wire clk, readMem;
	integer row_num;
	wire [element_width - 1:0] out_element [0: x_mem_height - 1]; //column vector
	reg [element_width - 1:0] target [0: x_mem_height -1];
	reg [element_width*no_of_elements - 1:0] out_elements;
	reg finish = 0;
	
	initial
		begin
			$readmemh("target.txt", target);
		end
		
	integer i;
	always @(readMem)
		begin
			if(readMem)	
				for(i = 0; i < x_mem_height; i = i +1) begin
					out_element[i] = target[16*row_num + i]; //element position depends on row number
				end
				assign out_elements = {out_element[0], out_element[1], out_element[2], out_element[3],
												out_element[4], out_element[5], out_element[6], out_element[7],
												out_element[8], out_element[9], out_element[10], out_element[11],
												out_element[12], out_element[13], out_element[14], out_element[15]};
				assign finish = 1;
		end
	
	
endmodule
