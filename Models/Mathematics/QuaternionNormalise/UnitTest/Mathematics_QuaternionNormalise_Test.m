%% Mathematics_QuaternionNormalise Model Test %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc

diary_file = [getenv('AeroSim_Install') '\Models\Mathematics\QuaternionNormalise\TestResults\Mathematics_QuaternionNormalise_Test_' date '.txt'];
if exist(diary_file, 'file')
    delete(diary_file)
end
diary(diary_file)

disp('-------------------------------------------------------------------')
disp('Mathematics_QuaternionNormalise Model Test')
disp('-------------------------------------------------------------------')

%% Initialisation
tolerance = 0.01;
time_span = 0;

%% Inputs
input_q = [1; 2; 3; 4];

%% Expected Output
expected_output_qn = qnorm(input_q);

%% Simulation
sim('Mathematics_QuaternionNormalise_TH', time_span)

%% Error Calculation
error = (output_qn' - expected_output_qn) ./ expected_output_qn;

%% Test Result
disp('Input:')
disp(['    q = [' num2str(input_q') ']'])
disp(' ')
disp('Expected Output:')
disp(['    qn = [' num2str(expected_output_qn') ']'])
disp(' ')
disp('Actual Output:')
disp(['    qn = [' num2str(output_qn) ']'])
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
clear diary_file time_span tolerance input_q expected_output_qn output_qn error