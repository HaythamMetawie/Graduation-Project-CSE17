@MATLAB files:
1)24_5.mat -> first number is the number of equations and the second is for the size of the hidden layer.
    e.g. 24_5 = 24 equations and 5 hidden neurons.
2)act_pred_err matrix is the result matrix from training:
    first column is the target, second is the calculated and third is the error.
3) elapsedTime variable in file is the time taken to train the network.
4) iter variable is the number of epocs taken to train the network.
===========================================================================================================
@bp.m:
1) line 2 hidden_neurons = #; # varies according to the number of the equations.