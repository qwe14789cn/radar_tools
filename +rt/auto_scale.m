%--------------------------------------------------------------------------
%   rt toolbox
%   author:qwe14789cn@gmail.com
%   https://github.com/qwe14789cn/radar_tools
%--------------------------------------------------------------------------
%   [output] = rt.auto_scale(sig,AD_len)
%--------------------------------------------------------------------------
%   Description:
%   Auto scale the raw data to AD Digit data type(ofen use for FPGA)
%--------------------------------------------------------------------------
%   input:
%           sig                 input signal
%           AD_len              AD digit
%   output:
%           output              int type of input signal
%--------------------------------------------------------------------------
%   Examples:
%   sig = [-10 -5 -3 -1 1 2 3 4 8];
%   [output] = rt.auto_scale(sig,10)
%   output =
%     -511  -256  -153   -51    51   102   153   204   409
%--------------------------------------------------------------------------
function [output] = auto_scale(sig,AD_len)
sig = sig./max(abs(sig));
output = round(sig .* (2^(AD_len-1)-1));
end