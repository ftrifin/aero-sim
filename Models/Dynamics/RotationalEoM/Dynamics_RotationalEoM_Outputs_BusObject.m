function Dynamics_RotationalEoM_Outputs_BusObject() 
% DYNAMICS_ROTATIONALEOM_OUTPUTS_BUSOBJECT initializes a set of bus objects in the MATLAB base workspace 

% Bus object: Dynamics_RotationalEoM_Outputs 
clear elems;
elems(1) = Simulink.BusElement;
elems(1).Name = 'Omega_Dot_vec_FB';
elems(1).Dimensions = 3;
elems(1).DimensionsMode = 'Fixed';
elems(1).DataType = 'double';
elems(1).SampleTime = -1;
elems(1).Complexity = 'real';
elems(1).SamplingMode = 'Sample based';
elems(1).Min = [];
elems(1).Max = [];

elems(2) = Simulink.BusElement;
elems(2).Name = 'Omega_vec_FB';
elems(2).Dimensions = 3;
elems(2).DimensionsMode = 'Fixed';
elems(2).DataType = 'double';
elems(2).SampleTime = -1;
elems(2).Complexity = 'real';
elems(2).SamplingMode = 'Sample based';
elems(2).Min = [];
elems(2).Max = [];

elems(3) = Simulink.BusElement;
elems(3).Name = 'q_FI_FB';
elems(3).Dimensions = 4;
elems(3).DimensionsMode = 'Fixed';
elems(3).DataType = 'double';
elems(3).SampleTime = -1;
elems(3).Complexity = 'real';
elems(3).SamplingMode = 'Sample based';
elems(3).Min = [];
elems(3).Max = [];

Dynamics_RotationalEoM_Outputs = Simulink.Bus;
Dynamics_RotationalEoM_Outputs.HeaderFile = '';
Dynamics_RotationalEoM_Outputs.Description = sprintf('');
Dynamics_RotationalEoM_Outputs.DataScope = 'Auto';
Dynamics_RotationalEoM_Outputs.Alignment = -1;
Dynamics_RotationalEoM_Outputs.Elements = elems;
assignin('base', 'Dynamics_RotationalEoM_Outputs', Dynamics_RotationalEoM_Outputs)

