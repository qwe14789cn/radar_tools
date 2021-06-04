%--------------------------------------------------------------------------
%   rt toolbox
%   author:qwe14789cn@gmail.com
%   https://github.com/qwe14789cn/radar_tools
%--------------------------------------------------------------------------
%   [sig] = rt.exp_wave(T,fp,fs)
%--------------------------------------------------------------------------
%   Description:
%   create complex waveform
%--------------------------------------------------------------------------
%   input:
%           T                   input signal time
%           fp                  signal frequency
%           fs                  sample frequency
%           fai                 start phase
%   output:
%           sig                 output signal
%--------------------------------------------------------------------------
%   Examples:   
%   rt.exp_wave(20e-6,1e6,5e6)
%--------------------------------------------------------------------------
function sig = exp_wave(T,fp,fs,fai)
if nargin==3
    fai = 0;
end
t = (0:1/fs:T-1/fs)';
sig = exp(1j*(2*pi*fp*t+fai));
end
