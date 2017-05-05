`timescale 1ns / 1ps
module random_fp_mem(output out_elements, output finish,  input clk, input addresses, input readMem);
	parameter randmem_height  =  256;
	parameter element_width = 32;
	parameter no_of_rand_elements = 16;
	wire readMem;
	wire [8*no_of_rand_elements - 1:0] addresses; //addresse of random numbers in randmem
	reg [element_width*no_of_rand_elements - 1:0] out_elements;
	reg [element_width - 1:0] randmem [0: randmem_height - 1];
	reg finish;
	integer j = 0;
	initial
		$readmemh("randmem.txt", randmem);
	integer i;
	always @(readMem)
		begin
			if(readMem)	
				for(i = 0; i < no_of_rand_elements; i = i +1) begin
					out_elements[element_width*i: element_width*i + 31] = randmem[addresses[8*i: 8*i + 7]];
					j = j +1;
				end
		end
		
	always@(posedge clk)
		begin
			if(j == no_of_rand_elements)
				begin
					finish <= 1;
				end
			end

endmodule
