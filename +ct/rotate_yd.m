%--------------------------------------------------------------------------
%   绕Y方向的旋转矩阵
%	example：
%	rotate_yd(30)*[x;y;z]
%--------------------------------------------------------------------------
function yaw = rotate_yd(theta)
yaw = [cosd(theta) 0 sind(theta);0 1 0;-sind(theta) 0 cosd(theta)];
end