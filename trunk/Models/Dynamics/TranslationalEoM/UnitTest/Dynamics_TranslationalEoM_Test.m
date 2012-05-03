%% Dynamics_TranslationalEoM Model Test %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
PlanetId = 1;
global_init;
time_span = 86164.1;

Dynamics.TranslationalEoM.Initialisation.Ini_Position_vec_FI = [nthroot(Global.Planet.Mu/Global.Planet.RotationalRate^2,3);0;0]; % Calculating geostationary orbit radius
Dynamics.TranslationalEoM.Initialisation.Ini_Velocity_vec_FI = cross([0;0;Global.Planet.RotationalRate],Dynamics.TranslationalEoM.Initialisation.Ini_Position_vec_FI); % Calculating geostationary orbit velocity above prime meridian

%% Inputs
Input_Mass = 500;

%% Expected Output
y0 = [Dynamics.TranslationalEoM.Initialisation.Ini_Velocity_vec_FI;Dynamics.TranslationalEoM.Initialisation.Ini_Position_vec_FI];
[T,Y] = ode45(@(t,y)orbit(t,y,Global.Planet.Mu),[0 time_span],y0,odeset('RelTol',1e-10));
Expected_Position_vec_FI = Y(end,4:6);

%% Simulation
sim([library '_' model '_TH'], time_span)

%% Error Calculation
error = (Output_Position_vec_FI(end,:) - Expected_Position_vec_FI) ./ Expected_Position_vec_FI;
error(isnan(error))=0;

%% Test Result
disp('Expected Output:')
disp(['    Position_vec_FI = [' num2str(Expected_Position_vec_FI) ']'])
disp(' ')
disp('Actual Output:')
disp(['    Position_vec_FI = [' num2str(Output_Position_vec_FI(end,:)) ']'])
disp(' ')
disp('Error:')
disp(['    e = [' num2str(error) ']'])
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
clear test tokens model library diary_file time_span tolerance Input_Mass Expected_Position_vec_FI Output_Position_vec_FI error tout Dynamics Global PlanetId T Y y0