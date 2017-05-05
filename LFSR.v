`timescale 1ns / 1ps
`define WIDTH 8 
module lfsr(clk, reset, enable, up_down, count, overflows);

input clk;
input reset;
input enable; 
input up_down;
output [`WIDTH-1 : 0] count;
output overflows;
reg [`WIDTH-1 : 0] count;
assign overflow = (up_down) ? (count == {{`WIDTH-1{1'b0}}, 1'b1}) : (count == {1'b1, {`WIDTH-1{1'b0}}});

always @(posedge clk)
	if (reset) 
		count <= {`WIDTH{1'b0}};
	else if (enable) begin
		if (up_down) begin
			count <= {~(^(count & `WIDTH'b01100011)),count[`WIDTH-1:1]};
		end else begin
		count <= {count[`WIDTH-2:0],~(^(count &  `WIDTH'b10110001))};
		end
	end
	
endmodule
