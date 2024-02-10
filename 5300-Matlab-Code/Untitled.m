clc;
clear;
csi_trace1 = read_bf_file('./0805/rev_40_1.dat'); % 数据文件路径

REV1_t1_r1 = zeros(30,length(csi_trace1));
REV1_t1_r2 = zeros(30,length(csi_trace1));
REV1_t1_r3 = zeros(30,length(csi_trace1));

for i = 1:length(csi_trace1)
    csi_entry = csi_trace1{i};
    csi = get_scaled_csi(csi_entry);
    REV1_t1_r1(:,i) = squeeze(csi(1,1,:));
    REV1_t1_r2(:,i) = squeeze(csi(1,2,:));
    REV1_t1_r3(:,i) = squeeze(csi(1,3,:));
end


%% 得到比率数据
REV1_ratio_r1r2 = REV1_t1_r1./REV1_t1_r2;
REV1_ratio_r1r3 = REV1_t1_r1./REV1_t1_r3;
REV1_ratio_r2r3 = REV1_t1_r2./REV1_t1_r3;


%比率振幅数据
REV1_abs_ratio_r1r2 = abs(REV1_ratio_r1r2);
REV1_abs_ratio_r1r3 = abs(REV1_ratio_r1r3);
REV1_abs_ratio_r2r3 = abs(REV1_ratio_r2r3);

REV1_angle_ratio_r1r2 = angle(REV1_ratio_r1r2);
REV1_angle_ratio_r1r3 = angle(REV1_ratio_r1r3);
REV1_angle_ratio_r2r3 = angle(REV1_ratio_r2r3);

REV1_abs_ratio_r1r2 = func_sg(REV1_abs_ratio_r1r2);
REV1_abs_ratio_r1r3 = func_sg(REV1_abs_ratio_r1r3);
REV1_abs_ratio_r2r3 = func_sg(REV1_abs_ratio_r2r3);

REV1_angle_ratio_r1r2 = func_sg(REV1_angle_ratio_r1r2);
REV1_angle_ratio_r1r3 = func_sg(REV1_angle_ratio_r1r3);
REV1_angle_ratio_r2r3 = func_sg(REV1_angle_ratio_r2r3);

% rev1_complex = REV1_abs_ratio_r1r2.*exp(1i*REV1_angle_ratio_r1r2);
% 
% % figure;
% % plot(REV1_abs_ratio_r1r2(1,:));
% 
% figure;
% for n = 1657:3287
% hold on;
% plot(rev1_complex(16,n),'.');
% pause(0.01);
% end

%去除振幅和相位异常值
REV1_abs_ratio_r1r2 = Use_hampel(REV1_abs_ratio_r1r2);
REV1_abs_ratio_r1r3 = Use_hampel(REV1_abs_ratio_r1r3);
REV1_abs_ratio_r2r3 = Use_hampel(REV1_abs_ratio_r2r3);


%对振幅和相位进行Savitzky-Golay滤波
REV1_abs_ratio_r1r2 = func_sg(REV1_abs_ratio_r1r2);
REV1_abs_ratio_r1r3 = func_sg(REV1_abs_ratio_r1r3);
REV1_abs_ratio_r2r3 = func_sg(REV1_abs_ratio_r2r3);

[COEFF1 ,SCORE1,latent1] = pca(REV1_abs_ratio_r1r2.');
explained1 = 100*latent1/sum(latent1);%计算贡献率
REV1_first_abs_csi = SCORE1(:,1);

figure;
plot(REV1_first_abs_csi);

distance_40_1 = REV1_first_abs_csi(1342:2759).';

distance_40_1 = distance_40_1.';