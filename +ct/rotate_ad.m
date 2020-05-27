%--------------------------------------------------------------------------
%   绕一个矢量轴方向的旋转矩阵
%	example：
%	vector1 = [1;2;3];
%	vector2 = [4 5 6];
%	rotate_ad(vector1,30)*[x;y;z]
%	rotate_ad(vector2,30)*[x;y;z]
%--------------------------------------------------------------------------
function T = rotate_ad(vector,theta)
Vx = vector(1);Vy = vector(2);Vz = vector(3);
T = [Vx^2*(1 - cosd(theta)) + cosd(theta)       Vx*Vy*(1 - cosd(theta)) + Vz*sind(theta)    Vx*Vz*(1 - cosd(theta)) - Vy*sind(theta);...
     Vx*Vy*(1 - cosd(theta)) - Vz*sind(theta)   Vy^2*(1 - cosd(theta)) + cosd(theta)        Vy*Vz*(1 - cosd(theta)) + Vx*sind(theta);...
     Vx*Vz*(1 - cosd(theta)) + Vy*sind(theta)   Vy*Vz*(1 - cosd(theta)) - Vx*sind(theta)     Vz^2*(1 - cosd(theta)) + cosd(theta)]';