% example:
% write_bin(download_data,'config.bin','single')

function [output] = write_bin(data_name,file_name,file_type)
f = fopen(file_name,'w');
output = fwrite(f,data_name,file_type);
fclose(f);
end
