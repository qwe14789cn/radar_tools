%--------------------------------------------------------------------------
% 迭代高斯拟合用于2个计算机生成的噪声高斯峰值信号的例程.输入变量是高度,位置,峰值
% 需要函数gaussian,fitgauss2animated,fminsearch在matlab中.
%--------------------------------------------------------------------------
disp('初始化')
%--------------------------------------------------------------------------
clear;clc;

%--------------------------------------------------------------------------
disp('参数配置')
%--------------------------------------------------------------------------
format compact                                                              %取消显示空行
global c NumTrials TrialError                                               %全局变量
warning off                                                                 %关闭警告

%--------------------------------------------------------------------------
disp('创建2个高斯峰值并加入随机噪声')
%--------------------------------------------------------------------------
k=5;                                                                        %时间轴步长 
NumTrials=0;
TrialError=0;

t=-0:k:500;
noise=0;
Height1=100;Position1=300;Width1=70;
Height2=50;Position2=200;Width2=150;

Peak1 = [Height1 Position1 Width1]
Peak2 = [Height2 Position2 Width2]
%--------------------------------------------------------------------------
disp('gaussian(横轴,中心位置,宽度)')
%--------------------------------------------------------------------------
y = Height1.*gaussian(t,Position1,Width1) + ...
    Height2.*gaussian(t,Position2,Width2) + ...
    noise.*randn(size(t));

%--------------------------------------------------------------------------
disp('寻找局部最优解')
disp('----------------------------------')
%--------------------------------------------------------------------------
% parameter=fminsearch(@(lambda)(fitgauss2animatedError(lambda,t,y)),start);
% parameter=NM(@(lambda)(fitgauss2animatedError(lambda,t,y)),start);
parameter1=PSO(@(lambda)(fitgauss2animatedError(lambda,t,y)),200,[200 400;0 150;100 300;50 250],[-2 2],1e-10)
parameter=NM(@(lambda)(fitgauss2animatedError(lambda,t,y)),parameter1)
disp('----------------------------------')
%--------------------------------------------------------------------------
disp('获得计算参数')
%--------------------------------------------------------------------------
MeasuredPeak1=[c(1) parameter(1) parameter(2)]
MeasuredPeak2=[c(2) parameter(3) parameter(4)]

%--------------------------------------------------------------------------
disp('重构波形')
%--------------------------------------------------------------------------
peak1=c(1).*gaussian(t,parameter(1),parameter(2));
peak2=c(2).*gaussian(t,parameter(3),parameter(4));
model=peak1+peak2;

%--------------------------------------------------------------------------
disp('可视化')
%--------------------------------------------------------------------------
figure(1)
subplot(121)
plot(t,y,'r.',t,peak1,'g--',t,peak2,'m-.',t,model,'b')
subplot(122)
step = 29;
semilogy(1:step:NumTrials,TrialError(1:step:end))
grid
xlabel('Iteration Number')
ylabel('Error')
title('Progress toward minimizing the fitting error')
