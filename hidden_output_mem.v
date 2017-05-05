`timescale 1ns / 1ps
module hidden_output_mem(output out_elements, output finish, input clk, input writeMem, input readMem, input in_data);
	parameter ho_mem_height = 64;
	parameter element_width = 32;
	parameter no_of_hidden_nodes = 20;
	wire clk, writeMem, readMem;
	reg [element_width - 1:0] out_elements [0: ho_mem_height - 1]; //column vector of size nx1
	reg [element_width - 1:0] ho_weights [0: no_of_hidden_nodes - 1];
	wire [element_width - 1:0] in_data [0: ho_mem_height -1];
	reg finish = 0;
	
	initial
		begin
			$readmemh("hidden_output_mem.txt", ho_weights);
		end
		
	integer i;
	always @(readMem)
		begin
			if(readMem && ~writeMem)	
				for(i = 0; i < ho_mem_height; i = i +1) begin
					out_elements[i] = ho_weights[i]; //element position depends on column number
				end
				finish = 1;
		end
	
	integer j;	
	always @(posedge clk)
		begin
			if(~readMem && writeMem)
				for(j = 0; j < ho_mem_height; j = j +1) begin // I have to check if it occurs sequentialy or in parallel.
					ho_weights[j]	= in_data[j]; //element position depends on column number
				end
				finish = 1;
			end
endmodule
