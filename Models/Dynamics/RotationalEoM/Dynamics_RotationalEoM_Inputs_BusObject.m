function Dynamics_RotationalEoM_Inputs_BusObject() 
% DYNAMICS_ROTATIONALEOM_INPUTS_BUSOBJECT initializes a set of bus objects in the MATLAB base workspace 

% Bus object: Dynamics_RotationalEoM_Inputs 
clear elems;
elems(1) = Simulink.BusElement;
elems(1).Name = 'Torque_vec_FB';
elems(1).Dimensions = 3;
elems(1).DimensionsMode = 'Fixed';
elems(1).DataType = 'double';
elems(1).SampleTime = -1;
elems(1).Complexity = 'real';
elems(1).SamplingMode = 'Sample based';
elems(1).Min = [];
elems(1).Max = [];

elems(2) = Simulink.BusElement;
elems(2).Name = 'Inertia_mat_FB';
elems(2).Dimensions = [3 3];
elems(2).DimensionsMode = 'Fixed';
elems(2).DataType = 'double';
elems(2).SampleTime = -1;
elems(2).Complexity = 'real';
elems(2).SamplingMode = 'Sample based';
elems(2).Min = [];
elems(2).Max = [];

Dynamics_RotationalEoM_Inputs = Simulink.Bus;
Dynamics_RotationalEoM_Inputs.HeaderFile = '';
Dynamics_RotationalEoM_Inputs.Description = sprintf('');
Dynamics_RotationalEoM_Inputs.DataScope = 'Auto';
Dynamics_RotationalEoM_Inputs.Alignment = -1;
Dynamics_RotationalEoM_Inputs.Elements = elems;
assignin('base', 'Dynamics_RotationalEoM_Inputs', Dynamics_RotationalEoM_Inputs)

