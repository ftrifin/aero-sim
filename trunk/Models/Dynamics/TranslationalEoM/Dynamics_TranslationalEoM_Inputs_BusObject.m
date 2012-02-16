function Dynamics_TranslationalEoM_Inputs_BusObject() 
% DYNAMICS_TRANSLATIONALEOM_INPUTS_BUSOBJECT initializes a set of bus objects in the MATLAB base workspace 

% Bus object: Dynamics_TranslationalEoM_Inputs 
clear elems;
elems(1) = Simulink.BusElement;
elems(1).Name = 'Force_vec_FI';
elems(1).Dimensions = 3;
elems(1).DimensionsMode = 'Fixed';
elems(1).DataType = 'double';
elems(1).SampleTime = -1;
elems(1).Complexity = 'real';
elems(1).SamplingMode = 'Sample based';
elems(1).Min = [];
elems(1).Max = [];

elems(2) = Simulink.BusElement;
elems(2).Name = 'Mass';
elems(2).Dimensions = 1;
elems(2).DimensionsMode = 'Fixed';
elems(2).DataType = 'double';
elems(2).SampleTime = -1;
elems(2).Complexity = 'real';
elems(2).SamplingMode = 'Sample based';
elems(2).Min = [];
elems(2).Max = [];

Dynamics_TranslationalEoM_Inputs = Simulink.Bus;
Dynamics_TranslationalEoM_Inputs.HeaderFile = '';
Dynamics_TranslationalEoM_Inputs.Description = sprintf('');
Dynamics_TranslationalEoM_Inputs.DataScope = 'Auto';
Dynamics_TranslationalEoM_Inputs.Alignment = -1;
Dynamics_TranslationalEoM_Inputs.Elements = elems;
assignin('base', 'Dynamics_TranslationalEoM_Inputs', Dynamics_TranslationalEoM_Inputs)

