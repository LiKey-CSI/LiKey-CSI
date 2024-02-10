%% �������εĴ��� 5��18��
clc;
clear;

csi_trace = read_bf_file('./523_fu/5_23_w/p1_123456789.dat'); % �����ļ�·��
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


%% �õ���������
ratio_r1r2 = csi_t1_r1./csi_t1_r2;
ratio_r1r3 = csi_t1_r1./csi_t1_r3;
ratio_r2r3 = csi_t1_r2./csi_t1_r3;

%�����������
abs_ratio_r1r2 = abs(ratio_r1r2);
abs_ratio_r1r3 = abs(ratio_r1r3);
abs_ratio_r2r3 = abs(ratio_r2r3);
%������λ����
phase_ratio_r1r2 = angle(ratio_r1r2);
phase_ratio_r1r3 = angle(ratio_r1r3);
phase_ratio_r2r3 = angle(ratio_r2r3);

%ȥ���������λ�쳣ֵ
abs_ratio_r1r2 = Use_hampel(abs_ratio_r1r2);
abs_ratio_r1r3 = Use_hampel(abs_ratio_r1r3);
abs_ratio_r2r3 = Use_hampel(abs_ratio_r2r3);

phase_ratio_r1r2 = Use_hampel(phase_ratio_r1r2);
phase_ratio_r1r3 = Use_hampel(phase_ratio_r1r3);
phase_ratio_r2r3 = Use_hampel(phase_ratio_r2r3);

%���������λ����Savitzky-Golay�˲�
abs_ratio_r1r2 = func_sg(abs_ratio_r1r2);
abs_ratio_r1r3 = func_sg(abs_ratio_r1r3);
abs_ratio_r2r3 = func_sg(abs_ratio_r2r3);

phase_ratio_r1r2 = func_sg(phase_ratio_r1r2);
phase_ratio_r1r3 = func_sg(phase_ratio_r1r3);
phase_ratio_r2r3 = func_sg(phase_ratio_r2r3);

%��һ������
abs_ratio_r1r2 = fun_allNormalized_1(abs_ratio_r1r2);
abs_ratio_r1r3 = fun_allNormalized_1(abs_ratio_r1r3);
abs_ratio_r2r3 = fun_allNormalized_1(abs_ratio_r2r3);
phase_ratio_r1r2 = fun_allNormalized_1(phase_ratio_r1r2);
phase_ratio_r1r3 = fun_allNormalized_1(phase_ratio_r1r3);
phase_ratio_r2r3 = fun_allNormalized_1(phase_ratio_r2r3);

abs_csi = [abs_ratio_r1r2;abs_ratio_r1r3;abs_ratio_r2r3];
phase_csi = [phase_ratio_r1r2;phase_ratio_r1r3;phase_ratio_r2r3];

[COEFF1 ,SCORE1,latent1] = pca(abs_csi.');
explained1 = 100*latent1/sum(latent1);%���㹱����
first_abs_csi = SCORE1(:,1);

[COEFF2,SCORE2,latent2] = pca(phase_csi.');
explained2 = 100*latent2/sum(latent2);%���㹱����
first_phase_csi = SCORE2(:,1);

figure;
subplot(2,1,1);
plot(first_abs_csi);
set(gca,'FontWeight','bold');
title('Ԥ����󡪡������һ���ɷ�','FontWeight','bold','FontSize',14);
xlabel('CSI Packet index');
ylabel('Value');
subplot(2,1,2);
plot(first_phase_csi);
set(gca,'FontWeight','bold');
title('Ԥ����󡪡���λ��һ���ɷ�','FontWeight','bold','FontSize',14);
xlabel('CSI Packet index');
ylabel('Value');
