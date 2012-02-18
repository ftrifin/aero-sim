%% Mathematics_QuaternionConjugate Model Test %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc

diary_file = [getenv('AeroSim_Install') '\Models\Mathematics\QuaternionConjugate\TestResults\Mathematics_QuaternionConjugate_Test_' date '.txt'];
if exist(diary_file, 'file')
    delete(diary_file)
end
diary(diary_file)

disp('-------------------------------------------------------------------')
disp('Mathematics_QuaternionConjugate Model Test')
disp('-------------------------------------------------------------------')

%% Initialisation
tolerance = 0.01;
time_span = 0;

%% Inputs
input_q = [0.5; 0.5; 0.5; 0.5];

%% Expected Output
expected_output_qc = qconj(input_q);

%% Simulation
sim('Mathematics_QuaternionConjugate_TH', time_span)

%% Error Calculation
error = (output_qc' - expected_output_qc) ./ expected_output_qc;

%% Test Result
disp('Input:')
disp(['    q = [' num2str(input_q') ']'])
disp(' ')
disp('Expected Output:')
disp(['    qc = [' num2str(expected_output_qc') ']'])
disp(' ')
disp('Actual Output:')
disp(['    qc = [' num2str(output_qc) ']'])
disp(' ')
disp('Error:')
disp(['    e = [' num2str(error') ']'])
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
diary off
clear diary_file time_span tolerance input_q expected_output_qc output_qc error