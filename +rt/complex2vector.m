%--------------------------------------------------------------------------
%   复数可视化
%	example:
%	complex2vector(randn(1,3) + 1j.*randn(1,3))
%--------------------------------------------------------------------------
function complex2vector(points,model)
if nargin == 1
    for idx = 1:numel(points)
        quiver(0,0,real(points(idx)),imag(points(idx)));
        text(real(points(idx)),imag(points(idx)),num2str(idx));
        hold on
    end
    hold off
else
    for idx = 1:numel(points)
        quiver3(idx,0,0,   0,real(points(idx)),imag(points(idx)));
        text(idx,real(points(idx)),imag(points(idx)),num2str(idx));
        hold on
    end
    plot3(1:numel(points),zeros(1,numel(points)),zeros(1,numel(points)),'k','LineWidth',1)
    plot3(1:numel(points),zeros(1,numel(points)),zeros(1,numel(points)),'ro','LineWidth',1)
    hold off
end
