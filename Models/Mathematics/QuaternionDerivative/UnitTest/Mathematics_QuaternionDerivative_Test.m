%% Mathematics_QuaternionDerivative Model Test %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc

diary_file = [getenv('AeroSim_Install') '\Models\Mathematics\QuaternionDerivative\TestResults\Mathematics_QuaternionDerivative_Test_' date '.txt'];
if exist(diary_file, 'file')
    delete(diary_file)
end
diary(diary_file)

disp('-------------------------------------------------------------------')
disp('Mathematics_QuaternionDerivative Model Test')
disp('-------------------------------------------------------------------')

%% Initialisation
tolerance = 0.01;
time_span = 0;

%% Inputs
input_q = [0.5; 0.5; 0.5; 0.5];
input_w = [1; 2; 4]*pi/180;

%% Expected Output
expected_output_dq = qderiv(input_q, input_w);

%% Simulation
sim('Mathematics_QuaternionDerivative_TH', time_span)

%% Error Calculation
error = (output_dq' - expected_output_dq) ./ expected_output_dq;

%% Test Result
disp('Input:')
disp(['    q = [' num2str(input_q') ']'])
disp(['    w = [' num2str(input_w') ']'])
disp(' ')
disp('Expected Output:')
disp(['    dq = [' num2str(expected_output_dq') ']'])
disp(' ')
disp('Actual Output:')
disp(['    dq = [' num2str(output_dq) ']'])
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
clear diary_file time_span tolerance input_q input_w expected_output_dq output_dq error