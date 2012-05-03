%% Environment_Gravity Model Test %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc

test = mfilename('fullpath');
tokens = regexp(test,filesep,'split');
model = char(tokens(end-2));
library = char(tokens(end-3));

diary_file = fullfile(getenv('AEROSIM_INSTALL'),'Models',library,model,'TestResults',[library '_' model '_Test_' date '.txt']);
if exist(diary_file, 'file')
    delete(diary_file)
end
diary(diary_file)

disp('-------------------------------------------------------------------')
disp([library '_' model ' Model Test'])
disp('-------------------------------------------------------------------')

%% Initialisation
tolerance = 0.01;
time_span = 0;
PlanetId=1;
global_init;

%% Inputs
Input_Position_vec_FI = [4.216417293115724e+07;0;0];

%% Expected Output
expected_output_g = -Input_Position_vec_FI*(Global.Planet.Mu/norm(Input_Position_vec_FI)^3);

%% Simulation
sim([library '_' model '_TH', time_span])

%% Error Calculation
error = (output_g' - expected_output_g) ./ expected_output_g;
error(isnan(error))=0;

%% Test Result
disp('Input:')
disp(['    Position_vec_FR = [' num2str(Input_Position_vec_FI') ']'])
disp(['    mu = ' num2str(Global.Planet.Mu')])
disp(' ')
disp('Expected Output:')
disp(['    g = [' num2str(expected_output_g') ']'])
disp(' ')
disp('Actual Output:')
disp(['    g = [' num2str(output_g) ']'])
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
clear test tokens model library diary_file time_span tolerance Input_Position_vec_FI PlanetId Global expected_output_g output_g error tout