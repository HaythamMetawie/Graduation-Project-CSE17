`timescale 1ns / 1ps
module tb;
	reg clk, reset, enable, up_down;
	wire [7:0] addresses [0:7];
	reg [32*16 - 1:0] weights;
	wire over_flow;
	genvar i;
	generate
	for(i = 0; i < 1; i = i+1)
		begin: generate_label
			weights_generator(.weights(weights), .all_finish(finish), .clk(clk), .reset(reset), .enable(enable));
		end
	endgenerate
	
	initial 
		begin
			clk = 0;
			reset = 1;
			#10 reset = 0;
			enable = 1;
		end
		
		
	always 
		begin
			#5 clk=~clk;
		end
		
		
		
endmodule
