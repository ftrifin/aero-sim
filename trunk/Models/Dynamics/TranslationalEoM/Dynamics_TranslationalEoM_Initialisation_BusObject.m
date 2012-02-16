function Dynamics_TranslationalEoM_Initialisation_BusObject() 
% DYNAMICS_TRANSLATIONALEOM_INITIALISATION_BUSOBJECT initializes a set of bus objects in the MATLAB base workspace 

% Bus object: Dynamics_TranslationalEoM_Initialisation 
clear elems;
elems(1) = Simulink.BusElement;
elems(1).Name = 'Ini_Velocity_vec_FI';
elems(1).Dimensions = 3;
elems(1).DimensionsMode = 'Fixed';
elems(1).DataType = 'double';
elems(1).SampleTime = -1;
elems(1).Complexity = 'real';
elems(1).SamplingMode = 'Sample based';
elems(1).Min = [];
elems(1).Max = [];

elems(2) = Simulink.BusElement;
elems(2).Name = 'Ini_Position_vec_FI';
elems(2).Dimensions = 3;
elems(2).DimensionsMode = 'Fixed';
elems(2).DataType = 'double';
elems(2).SampleTime = -1;
elems(2).Complexity = 'real';
elems(2).SamplingMode = 'Sample based';
elems(2).Min = [];
elems(2).Max = [];

Dynamics_TranslationalEoM_Initialisation = Simulink.Bus;
Dynamics_TranslationalEoM_Initialisation.HeaderFile = '';
Dynamics_TranslationalEoM_Initialisation.Description = sprintf('');
Dynamics_TranslationalEoM_Initialisation.DataScope = 'Auto';
Dynamics_TranslationalEoM_Initialisation.Alignment = -1;
Dynamics_TranslationalEoM_Initialisation.Elements = elems;
assignin('base', 'Dynamics_TranslationalEoM_Initialisation', Dynamics_TranslationalEoM_Initialisation)

