clc;
clear;

csi_trace = read_bf_file('./5_11/REV_W/p2_111111.dat'); % 数据文件路径
csi_t1_r1 = zeros(30,length(csi_trace));
csi_t1_r2 = zeros(30,length(csi_trace));
csi_t1_r3 = zeros(30,length(csi_trace));

for i = 1:length(csi_trace)
    csi_entry = csi_trace{i};
    csi = get_scaled_csi(csi_entry);
    csi_t1_r1(:,i) = squeeze(csi(1,1,:));
    csi_t1_r2(:,i) = squeeze(csi(1,2,:));
    csi_t1_r3(:,i) = squeeze(csi(1,3,:));
end

for i = 1:30
   tmp_csi = [csi_t1_r1(i,:);csi_t1_r2(i,:);csi_t1_r3(i,:)].';
   ans = remove_los(tmp_csi);
end