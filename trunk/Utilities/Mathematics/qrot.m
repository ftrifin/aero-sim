function [ va ] = qrot( vb, q )
%QROT Quaternion Rotation
%   va = QROT(vb,q) performs a quaternion rotation on a vector
%   in frame b to obtain a vector in frame a
%
%   vb is a vector measured frame b
%   q is the quaternion describing the rotation from frame a to b
%
%   Quaternions are assumed to be in the form of a four element column
%   vector with the scalar being the first element.
%
%   Vectors are assumed to be in the form of a three element column
%   vector

%   Author: Ryan Osborn
%   Created: 18/02/2012

if all(size(q) ~= [4 1])
    error('Quaternions must be four element column vectors with the scalar being the first element');
end

if all(size(vb) ~= [3 1])
    error('Vectors must be three element column vectors');
end

vb = [0;vb];

va = qmult(qmult(q,vb),qconj(q));
va = va(2:4);

end