function [ qn ] = qnorm( q )
%QNORM Quaternion Normalise
%   qn = QNORM(q) normalises a quaternion to a unit quaternion.
%
%   Quaternions are assumed to be in the form of a four element column
%   vector with the scalar being the first element.

%   Author: Ryan Osborn
%   Created: 18/02/2012

if all(size(q) ~= [4 1])
    error('Quaternions must be four element column vectors with the scalar being the first element');
end

qn = q/norm(q);

end