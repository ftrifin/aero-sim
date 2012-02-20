%% Mathematics_QuaternionMultiplication Model Test %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc

diary_file = [getenv('AeroSim_Install') '\Models\Mathematics\QuaternionMultiplication\TestResults\Mathematics_QuaternionMultiplication_Test_' date '.txt'];
if exist(diary_file, 'file')
    delete(diary_file)
end
diary(diary_file)

disp('-------------------------------------------------------------------')
disp('Mathematics_QuaternionMultiplication Model Test')
disp('-------------------------------------------------------------------')

%% Initialisation
tolerance = 0.01;
time_span = 0;

%% Inputs
input_q1 = [0.7071; 0.7071; 0; 0];
input_q2 = [0.7071; 0; 0.7071; 0];

%% Expected Output
expected_output_q = qmult(input_q1, input_q2);

%% Simulation
sim('Mathematics_QuaternionMultiplication_TH', time_span)

%% Error Calculation
error = (output_q' - expected_output_q) ./ expected_output_q;

%% Test Result
disp('Input:')
disp(['    q1 = [' num2str(input_q1') ']'])
disp(['    q2 = [' num2str(input_q2') ']'])
disp(' ')
disp('Expected Output:')
disp(['    q = [' num2str(expected_output_q') ']'])
disp(' ')
disp('Actual Output:')
disp(['    q = [' num2str(output_q) ']'])
disp(' ')
disp('Error:')
disp(['    e = [' num2str(error') ']'])
disp(' ')
disp('Tolerance:')
disp(['    t = ' num2str(tolerance)])

disp('-------------------------------------------------------------------')
if all(error) <= tolerance
    disp('TEST PASSED')
    result = true;
else
    disp('TEST FAILED')
    result = false;
end
disp('-------------------------------------------------------------------')

%% Clean Up
diary off
clear diary_file time_span tolerance input_q1 input_q2 expected_output_q output_q error