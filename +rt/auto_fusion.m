%--------------------------------------------------------------------------
%   rt toolbox
%   author:qwe14789cn@gmail.com
%   https://github.com/qwe14789cn/radar_tools
%--------------------------------------------------------------------------
%   [output] = auto_fusion(input_data,conn)
%--------------------------------------------------------------------------
%   Description:
%   Find connected components in binary image and calculate the weight
%   point
%--------------------------------------------------------------------------
%   input:
%           inputdata           input data
%           conn                Connectivity for the connected components
%
%   output:
%           output              weight point matrix
%--------------------------------------------------------------------------
%   Examples:
%--------------------------------------------------------------------------
function [output] = auto_fusion(input_data,conn)
CC = bwconncomp(input_data,conn);
N = CC.NumObjects;
output = zeros(N,2);
S = regionprops(CC,'Centroid');
for idx = 1:N
    output(idx,:) = S(idx).Centroid;
end
end
