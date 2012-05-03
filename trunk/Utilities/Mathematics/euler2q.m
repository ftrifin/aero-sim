function [q] = euler2q(psi,theta,phi)
%EULER2Q Euler Angles to Quaternion
%   q = EULER2Q(psi,theta,phi) computes the quaternion from 3-2-1 Euler
%   angles in radians
%
%   The first element of the quaternion is the scalar term
%
%   Author: Ryan Osborn
%   Created: 20/04/2012

q=[cos(psi/2)*cos(theta/2)*cos(phi/2)+sin(psi/2)*sin(theta/2)*sin(phi/2);
   cos(psi/2)*cos(theta/2)*sin(phi/2)-sin(psi/2)*sin(theta/2)*cos(phi/2);
   cos(psi/2)*sin(theta/2)*cos(phi/2)+sin(psi/2)*cos(theta/2)*sin(phi/2);
   sin(psi/2)*cos(theta/2)*cos(phi/2)-cos(psi/2)*sin(theta/2)*sin(phi/2)];

end
