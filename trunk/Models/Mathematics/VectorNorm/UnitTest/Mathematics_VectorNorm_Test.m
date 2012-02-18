%% Mathematics_VectorNorm Model Test %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc

diary_file = [getenv('AeroSim_Install') '\Models\Mathematics\VectorNorm\TestResults\Mathematics_VectorNorm_Test_' date '.txt'];
if exist(diary_file, 'file')
    delete(diary_file)
end
diary(diary_file)

disp('-------------------------------------------------------------------')
disp('Mathematics_VectorNorm Model Test')
disp('-------------------------------------------------------------------')

%% Initialisation
tolerance = 0.01;
time_span = 0;

%% Inputs
input_v = [1; 2; 3];

%% Expected Output
expected_output_vn = norm(input_v);

%% Simulation
sim('Mathematics_VectorNorm_TH', time_span)

%% Error Calculation
error = (output_vn - expected_output_vn) / expected_output_vn;

%% Test Result
disp('Input:')
disp(['    v = [' num2str(input_v') ']'])
disp(' ')
disp('Expected Output:')
disp(['    vn = ' num2str(expected_output_vn)])
disp(' ')
disp('Actual Output:')
disp(['    vn = ' num2str(output_vn)])
disp(' ')
disp('Error:')
disp(['    e = ' num2str(error)])
disp(' ')
disp('Tolerance:')
disp(['    t = ' num2str(tolerance)])

disp('-------------------------------------------------------------------')
if error <= tolerance
    disp('TEST PASSED')
else
    disp('TEST FAILED')
end
disp('-------------------------------------------------------------------')

%% Clean Up
diary off
clear diary_file time_span tolerance input_v expected_output_vn output_vn error