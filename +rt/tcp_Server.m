%function Received = tcp_Server(port,package_size)
t=tcpip('0.0.0.0',port,'NetworkRole','server');
t.InputBufferSize = package_size(1);
disp("等待连接");
fopen(t);
disp("接收数据");
TOTAL = package_size(2);
Received = uint8(zeros(package_size(1),package_size(2)));
while TOTAL
    try    
        Rx=fread(t,t.BytesAvailable);flag = 1;
    catch
        flag = 0;
    end
    
    if flag == 1
        Received(:,package_size(2)-TOTAL+1) = Rx;
        TOTAL = TOTAL-1;
    end
end
