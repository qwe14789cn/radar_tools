%--------------------------------------------------------------------------
%   判断射线与三角形面相交
%   射线和三角形的相交检测（ray triangle intersection test）
%   https://www.cnblogs.com/graphics/archive/2010/08/09/1795348.html
%   返回1，相交，返回0 不相交
%   example：
%   w = [1 -1 1;0 1 1;-1 -1 1]';
%   picking([0 0 0]',[10 0 1]',w)
%   picking([0 0 0]',[10 10 1]',w)
%--------------------------------------------------------------------------
function [result,t,u,v] = picking(O,D,tringle)
V0 = tringle(:,1);V1 = tringle(:,2);V2 = tringle(:,3);
E1 = V1 - V0;E2 = V2 - V0;P = cross(D,E2);
DET = dot(E1,P);

if DET>0
    T = O - V0;
else
    T = V0 - O;
    DET = - DET;
end

if DET < 0.0001
    result = false;
    return
end

u = dot(T,P);
if u <0.0 || u > DET
    result = false;
    return
end

Q = cross(T,E1);
v = dot(D,Q);

if v < 0.0 || (u + v) > DET
    result = false;
end

t = dot(E2,Q);
finvdet = 1/DET;
t = t*finvdet;
u = u*finvdet;
v = v*finvdet;
result = true;
