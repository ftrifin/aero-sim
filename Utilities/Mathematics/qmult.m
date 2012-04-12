function [ q ] = qmult( q1, q2 )
%QMULT Quaternion Multiplication
%   q = QMULT(q1,q2) computes the product of two quaternions.
%   If q1 denotes a rotation from a to b and q2 denotes a rotation from
%   b to c, then the product, q, will result in a rotation from a to c.
%
%   Quaternions are assumed to be in the form of a four element column
%   vector with the scalar being the first element.

%   Author: Ryan Osborn
%   Created: 18/02/2012

if all(size(q1) ~= [4 1]) && all(size(q2) ~= [4 1])
    error('Quaternions must be four element column vectors with the scalar being the first element');
end

q = [q1(1)*q2(1) - dot(q1(2:4),q2(2:4)); q1(1)*q2(2:4) + q2(1)*q1(2:4) + cross(q1(2:4),q2(2:4))];

end