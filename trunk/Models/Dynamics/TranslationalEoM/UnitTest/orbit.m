function [dy] = orbit(t,y,mu)
%ORBIT Summary of this function goes here
%   Detailed explanation goes here

v = y(1:3);
r = y(4:6);

dv = -r*(mu/norm(r)^3);
dr = v;

dy = [dv;dr];

end