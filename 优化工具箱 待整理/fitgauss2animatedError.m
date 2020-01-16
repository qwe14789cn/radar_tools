function err = fitgauss2animatedError(lambda,t,y)
%--------------------------------------------------------------------------
% 多个重叠高斯的拟合函数，添加了可视化部分,以减缓进度并绘制每个步骤
% t 时间轴 y信号回波
% lambda = [起始点1 宽度1 起始点2 宽度2]
%--------------------------------------------------------------------------
global c NumTrials TrialError
A = zeros(length(t),round(length(lambda)/2));                               %生成两组高斯拟合曲线缓冲区
%--------------------------------------------------------------------------
%   绘制2组高斯曲线
%--------------------------------------------------------------------------
for j = 1:length(lambda)/2
    A(:,j) = gaussian(t,lambda(2*j-1),lambda(2*j))';
end
%--------------------------------------------------------------------------
%   A*c=y'
%--------------------------------------------------------------------------
c = A\y';                                                                   %返回最小二乘解 c = (A'*A)^-1*A'*y';
z = A*c;                                                                    %最小二乘解的输出
err = norm(z-y');                                                           %二范数计算误差
peak1=c(1).*gaussian(t,lambda(1),lambda(2));
peak2=c(2).*gaussian(t,lambda(3),lambda(4));
model=peak1+peak2;

NumTrials=NumTrials+1;
TrialError(NumTrials)=err;
% 
% figure(1)
% subplot(121)
% plot(t,y,'r.',t,peak1,'g--',t,peak2,'m-.',t,model,'b')
% ylim([-400 400])
% title(num2str(err))
% subplot(122)
% semilogy(1:NumTrials,TrialError)
% drawnow
