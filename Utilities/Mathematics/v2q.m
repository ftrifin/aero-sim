function [ q ] = v2q( v1,v2 )
%V2Q Vector to Quaternion
%   q = V2Q(v1,v2) computes the quaternion that aligns vector v1 with
%   vector v2.
%
%   Author: SciSys
%   Created: 18/04/2012

uv1=v1/norm(v1);
uv2=v2/norm(v2);

q(1,1)=0.5*sqrt(2*(1+dot(uv1,uv2)));
q(2:4,1)=cross(uv1,uv2)/sqrt(2*(1+dot(uv1,uv2)));

end

