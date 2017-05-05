`timescale 1ns / 1ps
// The output of this memory is column from matrix. 
module input_hidden_mem(output out_element, output finish, input clk, input writeMem, input readMem, input column_number, input in_data);
	parameter ih_mem_height = 64;
	parameter element_width = 32;
	parameter no_of_hidden nodes = 20;
	wire clk, readMem, writeMem;
	wire column_number;
	reg [element_width - 1:0] out_element [0 : ih_mem_height + 1];
	reg [element_width - 1:0] ih_weights [0: ih_mem_height + 1][0: no_hidden_nodes-1]; 
	wire [element_width -1:0] in_data [0: ih_mem_height + 1];
	reg finish  = 0;
	
	initial
		begin
			$readmemh("input_hidden_mem.txt", ih_weights);
		end
		
		
	integer i;
	always @(readMem)
		begin
			if(readMem && ~writeMem)
				for(i = 0; i < ih_mem_height + 2; i = i +1) begin
					out_element[i] = ih_weights[i][column_number];
				end
				finish = 1;
		end
	
	integer j;	
	always @(posedge clk)
		begin
			if(~readMem && writeMem)
				for(j = 0; j < ih_mem_height + 2; j = j +1) begin // I have to check if it occurs sequentialy or in parallel.
					ih_weights[j][column_number]	= in_data[j];
				end
				finish = 1;
			end

endmodule
