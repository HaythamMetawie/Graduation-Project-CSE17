`timescale 1ns / 1ps
module X_mem(output out_elements, output finish, input clk, input writeMem, input readMem, input in_data);
	parameter x_mem_height = 64;
	parameter element_width = 32;
	wire clk, writeMem, readMem;
	reg [element_width*x_mem_height - 1:0] out_elements; //column vector of size nx1
	reg [element_width - 1:0] x_solution [0: x_mem_height -1];
	wire [element_width - 1*x_mem_height:0] in_data;
	reg finish = 0;
	
	initial
		begin
			$readmemh("X_mem.txt", x_solution);
		end
		
	integer i;
	always @(readMem)
		begin
			if(readMem && ~writeMem)	
				for(i = 0; i < x_mem_height; i = i +1) begin
					out_elements[element_width*i: element_width*i + 31] = x_solution[i]; //element position depends on column number
				end
				assign finish = 1;
		end
	
	integer j;	
	always @(posedge clk)
		begin
			if(~readMem && writeMem)
				for(j = 0; j < x_mem_height; j = j +1) begin // I have to check if it occurs sequentialy or in parallel.
					x_solution[j]	= in_data[element_width*j : element_width*j + 31];
				end
				assign finish = 1;
			end
endmodule
