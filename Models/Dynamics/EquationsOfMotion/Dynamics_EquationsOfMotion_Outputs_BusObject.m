function Dynamics_EquationsOfMotion_Outputs_BusObject() 
% DYNAMICS_EQUATIONSOFMOTION_OUTPUTS_BUSOBJECT initializes a set of bus objects in the MATLAB base workspace 

% Bus object: Dynamics_EquationsOfMotion_Outputs 
clear elems;
elems(1) = Simulink.BusElement;
elems(1).Name = 'Acceleration_vec_FI';
elems(1).Dimensions = 3;
elems(1).DimensionsMode = 'Fixed';
elems(1).DataType = 'double';
elems(1).SampleTime = -1;
elems(1).Complexity = 'real';
elems(1).SamplingMode = 'Sample based';
elems(1).Min = [];
elems(1).Max = [];

elems(2) = Simulink.BusElement;
elems(2).Name = 'Velocity_vec_FI';
elems(2).Dimensions = 3;
elems(2).DimensionsMode = 'Fixed';
elems(2).DataType = 'double';
elems(2).SampleTime = -1;
elems(2).Complexity = 'real';
elems(2).SamplingMode = 'Sample based';
elems(2).Min = [];
elems(2).Max = [];

elems(3) = Simulink.BusElement;
elems(3).Name = 'Position_vec_FI';
elems(3).Dimensions = 3;
elems(3).DimensionsMode = 'Fixed';
elems(3).DataType = 'double';
elems(3).SampleTime = -1;
elems(3).Complexity = 'real';
elems(3).SamplingMode = 'Sample based';
elems(3).Min = [];
elems(3).Max = [];

elems(4) = Simulink.BusElement;
elems(4).Name = 'Omega_Dot_vec_FB';
elems(4).Dimensions = 3;
elems(4).DimensionsMode = 'Fixed';
elems(4).DataType = 'double';
elems(4).SampleTime = -1;
elems(4).Complexity = 'real';
elems(4).SamplingMode = 'Sample based';
elems(4).Min = [];
elems(4).Max = [];

elems(5) = Simulink.BusElement;
elems(5).Name = 'Omega_vec_FB';
elems(5).Dimensions = 3;
elems(5).DimensionsMode = 'Fixed';
elems(5).DataType = 'double';
elems(5).SampleTime = -1;
elems(5).Complexity = 'real';
elems(5).SamplingMode = 'Sample based';
elems(5).Min = [];
elems(5).Max = [];

elems(6) = Simulink.BusElement;
elems(6).Name = 'q_FI_FB';
elems(6).Dimensions = 4;
elems(6).DimensionsMode = 'Fixed';
elems(6).DataType = 'double';
elems(6).SampleTime = -1;
elems(6).Complexity = 'real';
elems(6).SamplingMode = 'Sample based';
elems(6).Min = [];
elems(6).Max = [];

Dynamics_EquationsOfMotion_Outputs = Simulink.Bus;
Dynamics_EquationsOfMotion_Outputs.HeaderFile = '';
Dynamics_EquationsOfMotion_Outputs.Description = sprintf('');
Dynamics_EquationsOfMotion_Outputs.DataScope = 'Auto';
Dynamics_EquationsOfMotion_Outputs.Alignment = -1;
Dynamics_EquationsOfMotion_Outputs.Elements = elems;
assignin('base', 'Dynamics_EquationsOfMotion_Outputs', Dynamics_EquationsOfMotion_Outputs)

