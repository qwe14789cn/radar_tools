%--------------------------------------------------------------------------
%   nlm波形设计工具
%   qwe14789cn@gmail.com
%   201800514
%--------------------------------------------------------------------------
%   h_output = nlm_wave(T,bw,fs,Window)
%   bw 信号带宽,分布是从-bw/2到bw/2
%   T  信号长度
%   fs 生成速率，按照多少速率来生成信号
%   K  函数系数
%   Window频率窗函数选择,输入窗函数,例如@hamming,@taylorwin
%--------------------------------------------------------------------------
%   example
%   nlm_wave(20e-6,10e6,100e6,@hamming)
%   nlm_wave(20e-6,10e6,100e6,@hamming)
%   nlm_wave(20e-6,10e6,100e6,@hamming)
%--------------------------------------------------------------------------
function sig = nlm_wave(T,bw,fs,window)
N  = round(fs * T);
f  = -bw/2:bw/N:bw/2 - bw/N;
t  = 0:1/fs:T - 1/fs;
Wf  = window(N);
Tf  = cumtrapz(f,Wf);

Ft  = interp1(Tf,f,linspace(min(Tf),max(Tf),N));

phi = 2 * pi * cumtrapz(t,Ft);
sig = exp(1j*phi');
end
