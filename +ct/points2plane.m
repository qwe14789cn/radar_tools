%--------------------------------------------------------------------------
%   最小二乘法从点集合求解平面方程
%--------------------------------------------------------------------------
%   example:
%   points =  [0   216   216     0     0;...
%              0     0   135   135     0;
%              0     0     0     0     0]
%   [a,b,c,d] = board2plane(points)
%--------------------------------------------------------------------------
function [a,b,c,d] = points2plane(points)
flag = 0;
if size(points,1)==3
    if size(points,2)>=3
        flag = 1;
    end
end
if flag == 0
    disp("点集不符合要求：3xN矩阵，行表示xyz坐标")
    disp("------------------------------------")
    disp('x1 x2 x3 x4 x5 ...')
    disp('y1 y2 y3 y4 y5 ...')
    disp('z1 z2 z3 z4 z5 ...')
    disp("------------------------------------")
    return
end
mean_XYZ = mean(points,2);
mean_points = points-mean_XYZ;
S = mean_points*mean_points';
[D,~] = eig(S);a = D(1,1);b = D(2,1);c = D(3,1);
d = -a*mean_XYZ(1) - b*mean_XYZ(2) - c*mean_XYZ(3);
end
