%--------------------------------------------------------------------------
%   绕Z方向的旋转矩阵
%	example：
%	rotate_zd(30)*[x;y;z]
%--------------------------------------------------------------------------
function yaw = rotate_zd(theta)
yaw = [cosd(theta) -sind(theta) 0;sind(theta) cosd(theta) 0;0 0 1];
end