%--------------------------------------------------------------------------
%   å‘é‡å¯è§†åŒ–å‡½æ•°ï¼Œè¿‡åŽŸç‚¹å‘é‡? æ•°æ®æŒ‰ç…§åˆ—æŽ’åˆ?
%	exampleï¼?
%	show_vector([x;y;z])
%--------------------------------------------------------------------------
function show_vector(points)
for idx = 1:size(points,2)
    quiver3(0,0,0,points(1,idx),points(2,idx),points(3,idx));
    text(points(1,idx),points(2,idx),points(3,idx),num2str(idx))
    hold on
end
hold off
