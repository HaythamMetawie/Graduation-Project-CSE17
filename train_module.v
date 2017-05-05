// 1.pick random address for a random pattern using LFSR. (pattern here is an equation)
// 2.multiply this pattern by input_hidden weights.
// 3.multiply result of above multiplication by hidden_output weights.
// 4.calculate error = result of mul in step 3 - target.
// 5.delta_hidden_output = error * learning_rate * result of mul in step 2.
// 6.update ho_weights... check if I update non-zero elements weights only.
// 7.delta_input_hidden = learning_rate * error * ho_weights * pattern
// 8.update ih_weights
// 9.calcualte error again.. if reached error tolerance rise halt. 

module train_module;


endmodule
