%--------------------------------------------------------------------------
%   复噪声信号生成器
%   用法同randn
%--------------------------------------------------------------------------
function output = randn_complex(in,in2)
if nargin ==1
    output = 1./sqrt(2)*(randn(in) + 1j.*randn(in));
else
    output = 1./sqrt(2)*(randn(in,in2) + 1j.*randn(in,in2));
end
    
end