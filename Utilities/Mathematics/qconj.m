function [ qc ] = qconj( q )
%QCONJ Quaternion Conjugate
%   qc = QCONJ(q) computes the conjugate of a quaternion.
%   If q denotes a rotation from a to b, then the conjugate, qc, will
%   denote a rotation from b to a.
%
%   Quaternions are assumed to be in the form of a four element column
%   vector with the scalar being the first element.

%   Author: Ryan Osborn
%   Created: 18/02/2012

if all(size(q) ~= [4 1])
    error('Quaternions must be four element column vectors with the scalar being the first element');
end

qc = [q(1); -1*q(2:4)];

end