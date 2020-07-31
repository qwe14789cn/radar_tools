%--------------------------------------------------------------------------
%   rt toolbox
%   author:qwe14789cn@gmail.com
%   https://github.com/qwe14789cn/radar_tools
%--------------------------------------------------------------------------
%   rt.write_data(data_name,data_type,file_name)
%--------------------------------------------------------------------------
%   Description:
%   write matrix data to *.txt or *.dat file.
%--------------------------------------------------------------------------
%   input:
%           data_name               data name in workplace
%           data_type               string,float,int or something
%           file_name               the output filename
%   output:
%           None
%--------------------------------------------------------------------------
%   Examples:
%   a = [1 2 3;4 5 6;7 8 9];
%   rt.write_data(a,'a.txt','%d ')
%--------------------------------------------------------------------------
function write_data(data_name,file_name,data_type)
[M,~] = size(data_name);
f = fopen(file_name,'w');
for idx = 1:size(data_name,1)
    fprintf(f,data_type,data_name(idx,:));
    fprintf(f,'\n');
end
fclose(f);
end
