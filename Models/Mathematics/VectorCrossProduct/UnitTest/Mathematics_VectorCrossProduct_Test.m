%% Mathematics_VectorCrossProduct Model Test %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
disp('-------------------------------------------------------------------')
disp('Mathematics_VectorCrossProduct Model Test')
disp('-------------------------------------------------------------------')

%% Initialisation
tolerance = 0.01;
time_span = 0;

%% Inputs
input_v1 = [1 2 3];
input_v2 = [4 5 6];

%% Expected Output
expected_output_v = cross(input_v1, input_v2);

%% Simulation
sim('Mathematics_VectorCrossProduct_TH', time_span)

%% Error Calculation
error = (output_v - expected_output_v) ./ expected_output_v;

%% Test Result
disp('Input:')
disp(['    v1 = [' num2str(input_v1) ']'])
disp(['    v2 = [' num2str(input_v2) ']'])
disp(' ')
disp('Expected Output:')
disp(['    v = [' num2str(expected_output_v) ']'])
disp(' ')
disp('Actual Output:')
disp(['    v = [' num2str(output_v) ']'])
disp(' ')
disp('Error:')
disp(['    e = [' num2str(error) ']'])
disp(' ')
disp('Tolerance:')
disp(['    t = ' num2str(tolerance)])
disp('-------------------------------------------------------------------')
if all(error) <= tolerance
    disp('TEST PASSED')
else
    disp('TEST FAILED')
end
disp('-------------------------------------------------------------------')

%% Clean Up
clear time_span tolerance input_v1 input_v2 expected_output_v output_v error