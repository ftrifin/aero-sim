%% Mathematics_QuaternionTransformation Model Test %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc

diary_file = [getenv('AeroSim_Install') '\Models\Mathematics\QuaternionTransformation\TestResults\Mathematics_QuaternionTransformation_Test_' date '.txt'];
if exist(diary_file, 'file')
    delete(diary_file)
end
diary(diary_file)

disp('-------------------------------------------------------------------')
disp('Mathematics_QuaternionTransformation Model Test')
disp('-------------------------------------------------------------------')

%% Initialisation
tolerance = 0.01;
time_span = 0;

%% Inputs
input_va = [1;2;3];
input_q = [0.5; 0.5; 0.5; 0.5];

%% Expected Output
expected_output_vb = qtrans(input_va, input_q);

%% Simulation
sim('Mathematics_QuaternionTransformation_TH', time_span)

%% Error Calculation
error = (output_vb' - expected_output_vb) ./ expected_output_vb;

%% Test Result
disp('Input:')
disp(['    va = [' num2str(input_va') ']'])
disp(['    q = [' num2str(input_q') ']'])
disp(' ')
disp('Expected Output:')
disp(['    vb = [' num2str(expected_output_vb') ']'])
disp(' ')
disp('Actual Output:')
disp(['    vb = [' num2str(output_vb) ']'])
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
clear diary_file time_span tolerance input_va input_q expected_output_vb output_vb error