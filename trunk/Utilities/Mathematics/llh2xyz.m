function [ xyz ] = llh2xyz(phi, lambda, h, re, rp)
%LLH2XYZ Spherical to Cartesian Coordinates
%   xyz=LLH2XYZ(phi,lambda,h,re,rp) Calculates cartesian planet-centered
%   planet-fixed coordinates from the planetocentric latitude, longitude
%   and altitude.
%
%   phi (-pi/2 <= phi <= pi/2 [rads]) - latitude, measured as the angle
%   between the equatorial plane and the planetocentric radius.
%
%   lambda (-pi <= lambda <= pi [rads]) - longitude, measured as the angle
%   between the zero meridian and the projection of the planetocentric
%   radius on to the equatorial plane.
%
%   h [m] - planetocentric altitude, height above the reference ellipsoid.
%
%   re [m] - equatorial radius of the planet.
%
%   rp [m] - polar radius of the planet.

r = planet_radius(phi, re, rp);

xyz(1,1) = (r + h)*cos(phi)*cos(lambda);
xyz(2,1) = (r + h)*cos(phi)*sin(lambda);
xyz(3,1) = (r + h)*sin(phi);

end

