%--------------------------------------------------------------------------
%   rt toolbox
%   author:qwe14789cn@gmail.com
%   https://github.com/qwe14789cn/radar_tools
%--------------------------------------------------------------------------
%   [dataout] = rt.abs2db(datain)
%--------------------------------------------------------------------------
%   Description:
%   converse complex data to normalized dB type
%--------------------------------------------------------------------------
%   input:
%           datain                  input data
%
%   output:
%           dataout                 output data
%--------------------------------------------------------------------------
%   Examples:
%   a = [1+2j,3+4j];
%   rt.abs2db(a)
%   ans =
%   -6.9897         0
%--------------------------------------------------------------------------
function [dataout] = abs2db(datain)
dataout = db(datain);
dataout = dataout - max(dataout(:));
end