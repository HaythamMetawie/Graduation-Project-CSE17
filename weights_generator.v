`timescale 1ns / 1ps
// This module is used to generate weights matrices of neural network architecture. 
// We will instantiate this module in top module number of instances depends on cluster size twice,
// once for input_hidden weights and another for hidden_output weigths.
module weights_generator(output weights, output all_finish, input clk, input reset, input enable, input read_randMem);
	wire clk, reset, enable, read_randMem;
	//parameter no_of_columns = 64;
	//parameter no_of_rows = 64;
	parameter element_width = 32;
	parameter no_of_rand_elements = 16;
	reg finish = 0;
	reg all_finish  = 0;
	reg [element_width*no_of_rand_elements - 1:0] weights;
	
	integer j = 0;
	genvar i;
	generate
		for (i = 0; i < no_of_rand_elements; i = i +1)
			begin: generate_label
				wire [8*no_of_rand_elements - 1 : 0] addresses; 
				random_addresses inst(.addresses(addresses), .clk(clk), .reset(reset), .enable(enable));
				rand_fp_mem mem_inst(.out_elements(weights), .finish(finish), .clk(clk), .addresses(addresses), .readMem(read_randMem));
				assign j = j + 1;				
			end
	endgenerate					
	
	
	always @(posedge clk)
		begin
			if(j == no_of_rand_elements)
				assign all_finish = 1;
		end

endmodule
