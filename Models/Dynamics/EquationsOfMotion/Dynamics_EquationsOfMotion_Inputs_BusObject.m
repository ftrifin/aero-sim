function Dynamics_EquationsOfMotion_Inputs_BusObject() 
% DYNAMICS_EQUATIONSOFMOTION_INPUTS_BUSOBJECT initializes a set of bus objects in the MATLAB base workspace 

% Bus object: Dynamics_EquationsOfMotion_Inputs 
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

elems(3) = Simulink.BusElement;
elems(3).Name = 'Torque_vec_FB';
elems(3).Dimensions = 3;
elems(3).DimensionsMode = 'Fixed';
elems(3).DataType = 'double';
elems(3).SampleTime = -1;
elems(3).Complexity = 'real';
elems(3).SamplingMode = 'Sample based';
elems(3).Min = [];
elems(3).Max = [];

elems(4) = Simulink.BusElement;
elems(4).Name = 'Inertia_mat_FB';
elems(4).Dimensions = [3 3];
elems(4).DimensionsMode = 'Fixed';
elems(4).DataType = 'double';
elems(4).SampleTime = -1;
elems(4).Complexity = 'real';
elems(4).SamplingMode = 'Sample based';
elems(4).Min = [];
elems(4).Max = [];

Dynamics_EquationsOfMotion_Inputs = Simulink.Bus;
Dynamics_EquationsOfMotion_Inputs.HeaderFile = '';
Dynamics_EquationsOfMotion_Inputs.Description = sprintf('');
Dynamics_EquationsOfMotion_Inputs.DataScope = 'Auto';
Dynamics_EquationsOfMotion_Inputs.Alignment = -1;
Dynamics_EquationsOfMotion_Inputs.Elements = elems;
assignin('base', 'Dynamics_EquationsOfMotion_Inputs', Dynamics_EquationsOfMotion_Inputs)

