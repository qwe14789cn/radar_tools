%--------------------------------------------------------------------------
%   rt toolbox
%   author:qwe14789cn@gmail.com
%   https://github.com/qwe14789cn/radar_tools
%--------------------------------------------------------------------------
%   [dataout] = rt.data_reshape(datain,data_size)
%--------------------------------------------------------------------------
%   Description:
%   along the Column cut the data to the set size
%--------------------------------------------------------------------------
%   input:
%           datain                  input data
%           data_size               reshape size
%   output:
%           dataout                 output data
%--------------------------------------------------------------------------
%   Examples:
%   a = [1 2 3 4 5 6 7 8 9 10 11];
%   rt.data_reshape(a,2)
%   ans =
%     1     3     5     7     9
%     2     4     6     8    10
%   rt.data_reshape(a,2,1)
%   ans =
%      1     3     5     7     9    11
%      2     4     6     8    10     0
%   rt.data_reshape(a,[2 3],1)
%   ans(:,:,1) =
%      1     3     5
%      2     4     6
%   ans(:,:,2) =
%      7     9    11
%      8    10     0
%--------------------------------------------------------------------------
function [dataout] = data_reshape(datain,data_size,flag)
if nargin==2
    flag = 0;
elseif nargin == 3
    flag = flag;
end
datain = datain(:);
if length(data_size)==2
    level = floor(size(datain,1)/(data_size(1)*data_size(2)));              %先计算可以得到多少个CPI数量
    rest = datain(data_size(1)*data_size(2)*level+1:end,:);
    datain = datain(1:data_size(1)*data_size(2)*level,:);                   %重新切割数据
    dataout = reshape(datain,data_size(1),data_size(2),level);              %重新修改形状
    if flag == 1
        dataout(:,:,size(dataout,3)+1) = ...
            reshape([rest;zeros(data_size(1)*data_size(2) - ...
            numel(rest),1)],data_size);                                     %重新修改形状 补0
    end
elseif length(data_size)==1
    level = floor(size(datain,1)/(data_size(1)));                           %先计算可以得到多少个CPI数量
    rest = datain(data_size(1)*level+1:end,:);
    datain = datain(1:data_size(1)*level,:);                                %重新切割数据
    dataout = reshape(datain,data_size(1),level);                           %重新修改形状 不补0
    if flag == 1                 
        dataout = [dataout [rest;zeros(data_size(1)-numel(rest),1)]];       %重新修改形状 补0
    end
end
