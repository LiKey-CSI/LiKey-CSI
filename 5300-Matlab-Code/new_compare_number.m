%% ���������ļ��Ĳ��αȽ�
clc;
clear;

csi_trace1 = read_bf_file('./523_fu/5_23_w/p1_111111.dat'); % �����ļ�·��
csi_trace2 = read_bf_file('./523_fu/5_23_z/p1_111111.dat');
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

figure;
subplot(2,1,1);
hold on;
plot(REV1_first_abs_csi,'r');
plot(REV2_first_abs_csi,'b');
legend("Line1","Line2");
hold off;
set(gca,'FontWeight','bold');
title('Ԥ����󡪡������һ���ɷ�','FontWeight','bold','FontSize',14);
xlabel('CSI Packet index');
ylabel('Value');

subplot(2,1,2);
hold on;
plot(REV1_first_phase_csi,'r');
plot(REV2_first_phase_csi,'b');
legend("Line1","Line2");
hold off;
set(gca,'FontWeight','bold');
title('Ԥ����󡪡���λ��һ���ɷ�','FontWeight','bold','FontSize',14);
xlabel('CSI Packet index');
ylabel('Value');



%% ����ָ����Χ���в�����Χ�����
keystroke_range = 3079:3986;
Rev_1_max_min = max(REV1_first_abs_csi(keystroke_range))-min(REV1_first_abs_csi(keystroke_range));
Rev_2_max_min = max(REV2_first_abs_csi(keystroke_range))-min(REV2_first_abs_csi(keystroke_range));
max_min = [Rev_1_max_min Rev_2_max_min];%����
Rev_1_IQR = iqr(REV1_first_abs_csi(keystroke_range));
Rev_2_IQR = iqr(REV2_first_abs_csi(keystroke_range));
IQR = [Rev_1_IQR Rev_2_IQR];%�ķ�λ��
Rev_1_std = std(REV1_first_abs_csi(keystroke_range));
Rev_2_std = std(REV2_first_abs_csi(keystroke_range));
STD = [Rev_1_std Rev_2_std];%��׼��
Rev_1_var = var(REV1_first_abs_csi(keystroke_range));
Rev_2_var = var(REV2_first_abs_csi(keystroke_range));
VAR = [Rev_1_var Rev_2_var];%����
Rev_1_disper = std(REV1_first_abs_csi(keystroke_range))/mean(REV1_first_abs_csi(keystroke_range));
Rev_2_disper = std(REV2_first_abs_csi(keystroke_range))/mean(REV2_first_abs_csi(keystroke_range));
disper = [Rev_1_disper Rev_2_disper];%��ɢϵ��

feature = [max_min;IQR;STD;VAR;disper];