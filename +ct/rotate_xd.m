%--------------------------------------------------------------------------
%   绕X方向的旋转矩阵
%	example：
%	rotate_xd(30)*[x;y;z]
%--------------------------------------------------------------------------
function yaw = rotate_xd(theta)
yaw = [1 0 0;0 cosd(theta) -sind(theta);0 sind(theta) cosd(theta)];
end