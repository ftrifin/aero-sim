function [ r ] = planet_radius( phi, re, rp )
%PLANET_RADIUS Planet Radius
%   r=planet_radius(phi,re,rp) Computes the planet radius based on the
%   reference ellipsoid at a given latitude.
%
%   phi (-pi/2 <= phi <= pi/2 [rads]) - latitude, measured as the angle
%   between the equatorial plane and the planetocentric radius.
%
%   re [m] - equatorial radius of the planet.
%
%   rp [m] - polar radius of the planet.

r = sqrt(((re^2)*(rp^2))/((rp^2)*(cos(phi)^2) + (re^2)*(sin(phi)^2)));

end

