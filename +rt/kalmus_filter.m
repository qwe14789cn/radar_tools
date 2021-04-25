%--------------------------------------------------------------------------
%   kalmus�˲���
%   20180419
%   ����
%   qwe14789cn@gmail.com
%--------------------------------------------------------------------------
%   function H = kalmus_filter(N,order)
%   N       �˲����������
%   order   �˲�������
%--------------------------------------------------------------------------
function H = kalmus_filter(N,order)
fc = linspace(-0.5,0.5,N);
H1 = sin( pi*order*(fc - 1/2/order) ) ./ (pi*(fc - 1/2/order));
H2 = sin( pi*order*(fc + 1/2/order) ) ./ (pi*(fc + 1/2/order));
H =abs(H1-H2)';
H = H./max(H);
end
