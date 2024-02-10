%% ������ʾ�źŵĶ�����Ƶ��ͼ
clc;
clear;

csi_trace1 = read_bf_file('./523_fu/5_23_w/p2_123456789.dat'); % �����ļ�·��
csi_trace2 = read_bf_file('./523_fu/5_23_z/p2_123456789.dat');
REV1_t1_r1 = zeros(30,length(csi_trace1));
REV1_t1_r2 = zeros(30,length(csi_trace1));
REV1_t1_r3 = zeros(30,length(csi_trace1));
REV2_t1_r1 = zeros(30,length(csi_trace2));
REV2_t1_r2 = zeros(30,length(csi_trace2));
REV2_t1_r3 = zeros(30,length(csi_trace2));

for i = 1:length(csi_trace1)
    csi_entry = csi_trace1{i};
    csi = get_scaled_csi(csi_entry);
    REV1_t1_r1(:,i) = squeeze(csi(1,1,:));
    REV1_t1_r2(:,i) = squeeze(csi(1,2,:));
    REV1_t1_r3(:,i) = squeeze(csi(1,3,:));
end

for i = 1:length(csi_trace2)
    csi_entry = csi_trace2{i};
    csi = get_scaled_csi(csi_entry);
    REV2_t1_r1(:,i) = squeeze(csi(1,1,:));
    REV2_t1_r2(:,i) = squeeze(csi(1,2,:));
    REV2_t1_r3(:,i) = squeeze(csi(1,3,:));
end

%% �õ���������
REV1_ratio_r1r2 = REV1_t1_r1./REV1_t1_r2;
REV1_ratio_r1r3 = REV1_t1_r1./REV1_t1_r3;
REV1_ratio_r2r3 = REV1_t1_r2./REV1_t1_r3;

REV2_ratio_r1r2 = REV2_t1_r1./REV2_t1_r2;
REV2_ratio_r1r3 = REV2_t1_r1./REV2_t1_r3;
REV2_ratio_r2r3 = REV2_t1_r2./REV2_t1_r3;

%�����������
REV1_abs_ratio_r1r2 = abs(REV1_ratio_r1r2);
REV1_abs_ratio_r1r3 = abs(REV1_ratio_r1r3);
REV1_abs_ratio_r2r3 = abs(REV1_ratio_r2r3);

REV2_abs_ratio_r1r2 = abs(REV2_ratio_r1r2);
REV2_abs_ratio_r1r3 = abs(REV2_ratio_r1r3);
REV2_abs_ratio_r2r3 = abs(REV2_ratio_r2r3);

%������λ����
REV1_phase_ratio_r1r2 = angle(REV1_ratio_r1r2);
REV1_phase_ratio_r1r3 = angle(REV1_ratio_r1r3);
REV1_phase_ratio_r2r3 = angle(REV1_ratio_r2r3);

REV2_phase_ratio_r1r2 = angle(REV2_ratio_r1r2);
REV2_phase_ratio_r1r3 = angle(REV2_ratio_r1r3);
REV2_phase_ratio_r2r3 = angle(REV2_ratio_r2r3);

%ȥ���������λ�쳣ֵ
REV1_abs_ratio_r1r2 = Use_hampel(REV1_abs_ratio_r1r2);
REV1_abs_ratio_r1r3 = Use_hampel(REV1_abs_ratio_r1r3);
REV1_abs_ratio_r2r3 = Use_hampel(REV1_abs_ratio_r2r3);

REV2_abs_ratio_r1r2 = Use_hampel(REV2_abs_ratio_r1r2);
REV2_abs_ratio_r1r3 = Use_hampel(REV2_abs_ratio_r1r3);
REV2_abs_ratio_r2r3 = Use_hampel(REV2_abs_ratio_r2r3);

REV1_phase_ratio_r1r2 = Use_hampel(REV1_phase_ratio_r1r2);
REV1_phase_ratio_r1r3 = Use_hampel(REV1_phase_ratio_r1r3);
REV1_phase_ratio_r2r3 = Use_hampel(REV1_phase_ratio_r2r3);

REV2_phase_ratio_r1r2 = Use_hampel(REV2_phase_ratio_r1r2);
REV2_phase_ratio_r1r3 = Use_hampel(REV2_phase_ratio_r1r3);
REV2_phase_ratio_r2r3 = Use_hampel(REV2_phase_ratio_r2r3);

%���������λ����Savitzky-Golay�˲�
REV1_abs_ratio_r1r2 = func_sg(REV1_abs_ratio_r1r2);
REV1_abs_ratio_r1r3 = func_sg(REV1_abs_ratio_r1r3);
REV1_abs_ratio_r2r3 = func_sg(REV1_abs_ratio_r2r3);

REV2_abs_ratio_r1r2 = func_sg(REV2_abs_ratio_r1r2);
REV2_abs_ratio_r1r3 = func_sg(REV2_abs_ratio_r1r3);
REV2_abs_ratio_r2r3 = func_sg(REV2_abs_ratio_r2r3);

REV1_phase_ratio_r1r2 = func_sg(REV1_phase_ratio_r1r2);
REV1_phase_ratio_r1r3 = func_sg(REV1_phase_ratio_r1r3);
REV1_phase_ratio_r2r3 = func_sg(REV1_phase_ratio_r2r3);

REV2_phase_ratio_r1r2 = func_sg(REV2_phase_ratio_r1r2);
REV2_phase_ratio_r1r3 = func_sg(REV2_phase_ratio_r1r3);
REV2_phase_ratio_r2r3 = func_sg(REV2_phase_ratio_r2r3);


%��һ������
REV1_abs_ratio_r1r2 = fun_allNormalized_1(REV1_abs_ratio_r1r2);
REV1_abs_ratio_r1r3 = fun_allNormalized_1(REV1_abs_ratio_r1r3);
REV1_abs_ratio_r2r3 = fun_allNormalized_1(REV1_abs_ratio_r2r3);
REV1_phase_ratio_r1r2 = fun_allNormalized_1(REV1_phase_ratio_r1r2);
REV1_phase_ratio_r1r3 = fun_allNormalized_1(REV1_phase_ratio_r1r3);
REV1_phase_ratio_r2r3 = fun_allNormalized_1(REV1_phase_ratio_r2r3);

REV2_abs_ratio_r1r2 = fun_allNormalized_1(REV2_abs_ratio_r1r2);
REV2_abs_ratio_r1r3 = fun_allNormalized_1(REV2_abs_ratio_r1r3);
REV2_abs_ratio_r2r3 = fun_allNormalized_1(REV2_abs_ratio_r2r3);
REV2_phase_ratio_r1r2 = fun_allNormalized_1(REV2_phase_ratio_r1r2);
REV2_phase_ratio_r1r3 = fun_allNormalized_1(REV2_phase_ratio_r1r3);
REV2_phase_ratio_r2r3 = fun_allNormalized_1(REV2_phase_ratio_r2r3);

REV1_abs_csi = [REV1_abs_ratio_r1r2;REV1_abs_ratio_r1r3;REV1_abs_ratio_r2r3];
REV2_abs_csi = [REV2_abs_ratio_r1r2;REV2_abs_ratio_r1r3;REV2_abs_ratio_r2r3];

REV1_phase_csi = [REV1_phase_ratio_r1r2;REV1_phase_ratio_r1r3;REV1_phase_ratio_r2r3];
REV2_phase_csi = [REV2_phase_ratio_r1r2;REV2_phase_ratio_r1r3;REV2_phase_ratio_r2r3];

[COEFF1 ,SCORE1,latent1] = pca(REV1_abs_csi.');
explained1 = 100*latent1/sum(latent1);%���㹱����
REV1_first_abs_csi = SCORE1(:,1);

[COEFF2,SCORE2,latent2] = pca(REV1_phase_csi.');
explained2 = 100*latent2/sum(latent2);%���㹱����
REV1_first_phase_csi = SCORE2(:,1);

[COEFF3 ,SCORE3,latent3] = pca(REV2_abs_csi.');
explained3 = 100*latent3/sum(latent3);%���㹱����
REV2_first_abs_csi = SCORE3(:,1);

[COEFF4,SCORE4,latent4] = pca(REV2_phase_csi.');
explained4 = 100*latent4/sum(latent4);%���㹱����
REV2_first_phase_csi = SCORE4(:,1);

% ���ò���
Fs = 1;  % ������
window = 100;  % ���ں���
noverlap = 50;  % �ص�����
nfft = 256;  % FFT����
show_f = 1:30;

% ���ƶ�����Ƶ��ͼ
figure;
subplot(2,2,1);
[s,f,t,p] = spectrogram(REV1_first_abs_csi, window, noverlap, show_f, Fs);
imagesc(t,f,p);
set(gca,'YDir','normal')
xlabel("Samples");
ylabel('Frequency');
title('REV1��Amplitude');
colorbar;
subplot(2,2,2);
[s,f,t,p] = spectrogram(REV1_first_phase_csi, window, noverlap, show_f, Fs);
imagesc(t,f,p);
set(gca,'YDir','normal')
xlabel("Samples");
ylabel('Frequency');
title('REV1��Phase');
colorbar;
subplot(2,2,3);
[s,f,t,p] = spectrogram(REV2_first_abs_csi, window, noverlap, show_f, Fs);
imagesc(t,f,p);
set(gca,'YDir','normal')
xlabel("Samples");
ylabel('Frequency');
title('REV2��Amplitude');
colorbar;
subplot(2,2,4);
[s,f,t,p] = spectrogram(REV2_first_phase_csi, window, noverlap, show_f, Fs);
imagesc(t,f,p);
set(gca,'YDir','normal')
xlabel("Samples");
ylabel('Frequency');
title('REV2��Phase');
colorbar;