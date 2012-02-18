%% Mathematics_UnitVector Model Test %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc

diary_file = [getenv('AeroSim_Install') '\Models\Mathematics\UnitVector\TestResults\Mathematics_UnitVector_Test_' date '.txt'];
if exist(diary_file, 'file')
    delete(diary_file)
end
diary(diary_file)

disp('-------------------------------------------------------------------')
disp('Mathematics_UnitVector Model Test')
disp('-------------------------------------------------------------------')

%% Initialisation
tolerance = 0.01;
time_span = 0;

%% Inputs
input_v = [1; 2; 3];

%% Expected Output
expected_output_uv = input_v/norm(input_v);

%% Simulation
sim('Mathematics_UnitVector_TH', time_span)

%% Error Calculation
error = (output_uv' - expected_output_uv) ./ expected_output_uv;

%% Test Result
disp('Input:')
disp(['    v = [' num2str(input_v') ']'])
disp(' ')
disp('Expected Output:')
disp(['    uv = [' num2str(expected_output_uv') ']'])
disp(' ')
disp('Actual Output:')
disp(['    uv = [' num2str(output_uv) ']'])
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
clear diary_file time_span tolerance input_v expected_output_uv output_uv error