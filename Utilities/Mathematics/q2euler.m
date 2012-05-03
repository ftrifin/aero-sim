function [ psi,theta,phi ] = q2euler( q )
%Q2EULER Quaternion to Euler Angles
%   [psi,theta,phi]=Q2EULER(q) computes 3-2-1 Euler angles from a
%   quaternion
%
%   Quaternions are assumed to be in the form of a four element column
%   vector with the scalar being the first element.
%
%   Author: Ryan Osborn
%   Created: 18/04/2012

if size(q) ~= [4 1]
    error('Quaternions must be four element column vectors with the scalar being the first element');
end

theta = asin(-2*(q(2)*q(4) - q(1)*q(3)));
phi = acos((q(1)^2 - q(2)^2 - q(3)^2 + q(4)^2)/cos(theta))*sign(q(3)*q(4) + q(2)*q(1));
psi = acos((q(1)^2 + q(2)^2 - q(3)^2 - q(4)^2)/cos(theta))*sign(q(2)*q(3) + q(1)*q(4));

end
