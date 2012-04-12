function [ dq ] = qderiv( q, w )
%QDERIV Quaternion Derivative
%   dq = QDERIV(q,w) computes the derivative.
%   q is the quaternion describing the rotation from frame a to b
%   w is the angular velocity of frame b with respect to frame a
%
%   Quaternions are assumed to be in the form of a four element column
%   vector with the scalar being the first element.
%
%   Angular velocity is assumed to be in the form of a three element column
%   vector

%   Author: Ryan Osborn
%   Created: 18/02/2012

if all(size(q) ~= [4 1])
    error('Quaternions must be four element column vectors with the scalar being the first element');
end

if all(size(w) ~= [3 1])
    error('Angular velocity must be a three element column vector');
end

w = [0;w];

dq = 0.5*qmult(q,w);

end