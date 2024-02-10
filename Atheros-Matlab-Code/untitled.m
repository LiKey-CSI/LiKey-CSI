%% 观察文件的时间戳是否正常

clc;
clear;
%% 幅度处理过程
csi_trace = read_log_file('./data/move10.dat');%指定读取的数据文件
% csi_trace = fun_delete_zeroCSI(csi_trace);

L = length(csi_trace);

time_record = zeros(1,L);
for i=1:L
     time_record(i) = csi_trace{i}.timestamp;
end

figure;
plot(time_record);