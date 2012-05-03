function [ phi, lambda, h ] = xyz2llh( xyz, re, rp )
%XYZ2LLH Cartesian to Spherical Coordinates
%   [phi,lambda,h]=LLH2XYZ(xyz,re,rp) Calculates planetocentric latitude,
%   longitude and altitude from cartesian planet-centered planet-fixed
%   coordinates.
%
%   xyz [m] - position vector in the planet-centered planet-fixed
%   coordinate system.
%
%   re [m] - equatorial radius of the planet.
%
%   rp [m] - polar radius of the planet.

phi = asin(xyz(3)/norm(xyz));
lambda = atan2(xyz(2),xyz(1));
h = norm(xyz) - planet_radius(phi, re, rp);

end

