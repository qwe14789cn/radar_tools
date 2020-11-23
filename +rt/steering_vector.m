%--------------------------------------------------------------------------
%   rt toolbox
%   author:qwe14789cn@gmail.com
%   https://github.com/qwe14789cn/radar_tools
%--------------------------------------------------------------------------
%   [dataout] = rt.steeringvector(array_pos,sig_pos)
%--------------------------------------------------------------------------
%   Description:
%   from array postion and signal pos get Steering Vector
%--------------------------------------------------------------------------
%   input:
%           array_pos               Rx sig array position
%           sig_pos                 Tx sig position
%           lambda                  wavelength
%
%   output:
%           A                       steeringvector
%--------------------------------------------------------------------------
%   Examples:
%--------------------------------------------------------------------------
% c = 3e8;
% fc = 20e9;
% lambda = c/fc;
% tgt_angle = [50 90 140];                                                    
% R = [1000 5600 9000];
% 
% tgt_pos = [R.*cosd(tgt_angle);R.*sind(tgt_angle);zeros(1,3)]; 
% radar_pos = [zeros(1,8);lambda/2*(1:8)-4*lambda/2 - lambda/4;zeros(1,8)];
% steering_vector(radar_pos,tgt_pos(:,1),lambda)
%--------------------------------------------------------------------------
function A = steering_vector(array_pos,sig_pos,lambda)
for idx = 1:size(array_pos,2)
    R(idx,:) = norm(array_pos(:,idx)-sig_pos);
end
A = exp(1j.*2*pi*R./lambda);
A = conj(A);
end