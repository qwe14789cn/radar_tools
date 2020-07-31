%--------------------------------------------------------------------------
%   rt toolbox
%   author:qwe14789cn@gmail.com
%   https://github.com/qwe14789cn/radar_tools
%--------------------------------------------------------------------------
%   [d] = rt.b2d(data,N_bit)
%--------------------------------------------------------------------------
%   Description:
%   converse Binary complement to Decimal(ofen use for FPGA test)
%--------------------------------------------------------------------------
%   input:
%           datain                  input data
%           N_bit                   converse digit
%   output:
%           dataout                 output data
%--------------------------------------------------------------------------
%   Examples:
%   rt.b2d('1101',5)
%   ans =
%      13
%--------------------------------------------------------------------------
function [dataout] = b2d(datain,N_bit)
dataout = bin2dec(datain);
dataout(dataout>=2^(N_bit-1)) = dataout(dataout>=2^(N_bit-1))-2^N_bit;
end