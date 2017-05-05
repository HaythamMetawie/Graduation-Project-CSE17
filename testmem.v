`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:39:13 04/23/2017 
// Design Name: 
// Module Name:    test_mem 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module test_mem(input a, input b, output x);
	integer a;
	integer b;
	reg [a -1 :0] x [0: b-1];
	integer i;	
	for (i = 0; i <a*b; i = i+1)
		begin
			assign x[i][1] = 1'b1;
		end

endmodule
