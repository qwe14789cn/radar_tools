%--------------------------------------------------------------------------
%   向量可视化函数，过原点向量 数据按照列排列
%	example：
%	show_vector([x;y;z])
%--------------------------------------------------------------------------
function show_vector(points)
figure;
for idx = 1:size(points,2)
    quiver3(0,0,0,points(1,idx),points(2,idx),points(3,idx));
    text(points(1,idx),points(2,idx),points(3,idx),num2str(idx))
    hold on
end
grid on;axis equal;hold off;axis([-1.2 1.2 -1.2 1.2 -1.2 1.2])
xlabel("X");ylabel("Y");zlabel("Z")