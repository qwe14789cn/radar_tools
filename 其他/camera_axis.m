%--------------------------------------------------------------------------
%   相机坐标系
%--------------------------------------------------------------------------
f = figure(1);
peaks;
set(f.Children ,'XAxisLocation','top','YAxisLocation',...
            'left','ZDir','reverse');  
xlabel(f.Children,'X');ylabel(f.Children,'Z');zlabel(f.Children,'Y');