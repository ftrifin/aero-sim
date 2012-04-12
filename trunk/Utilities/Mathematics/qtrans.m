function [ vb ] = qtrans( va, q )
%QTRANS Quaternion Transformation
%   vb = QTRANS(va,q) performs a quaternion transformation on a vector
%   in frame a to obtain a vector in frame b
%
%   va is a vector measured frame a
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

if all(size(va) ~= [3 1])
    error('Vectors must be three element column vectors');
end

va = [0;va];

vb = qmult(qmult(qconj(q),va),q);
vb = vb(2:4);

end