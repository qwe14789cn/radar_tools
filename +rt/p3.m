%--------------------------------------------------------------------------
%   复信号画图工具
%--------------------------------------------------------------------------
%   example
%   p3(sig)
%--------------------------------------------------------------------------
function p3(signal,mark)
if nargin==2
    plot3(1:size(signal,1),real(signal),imag(signal),mark);grid on
    xlabel('点数');ylabel('实部');zlabel('虚部')
elseif nargin ==1
    plot3(1:size(signal,1),real(signal),imag(signal));grid on
    xlabel('点数');ylabel('实部');zlabel('虚部')
end