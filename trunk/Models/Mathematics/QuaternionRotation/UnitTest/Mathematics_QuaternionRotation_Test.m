%% Mathematics_QuaternionRotation Model Test %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc

diary_file = [getenv('AeroSim_Install') '\Models\Mathematics\QuaternionRotation\TestResults\Mathematics_QuaternionRotation_Test_' date '.txt'];
if exist(diary_file, 'file')
    delete(diary_file)
end
diary(diary_file)

disp('-------------------------------------------------------------------')
disp('Mathematics_QuaternionRotation Model Test')
disp('-------------------------------------------------------------------')

%% Initialisation
tolerance = 0.01;
time_span = 0;

%% Inputs
input_vb = [2;3;1];
input_q = [0.5; 0.5; 0.5; 0.5];

%% Expected Output
expected_output_va = qrot(input_vb, input_q);

%% Simulation
sim('Mathematics_QuaternionRotation_TH', time_span)

%% Error Calculation
error = (output_va' - expected_output_va) ./ expected_output_va;

%% Test Result
disp('Input:')
disp(['    vb = [' num2str(input_vb') ']'])
disp(['    q = [' num2str(input_q') ']'])
disp(' ')
disp('Expected Output:')
disp(['    va = [' num2str(expected_output_va') ']'])
disp(' ')
disp('Actual Output:')
disp(['    va = [' num2str(output_va) ']'])
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
clear diary_file time_span tolerance input_vb input_q expected_output_va output_va error