%% �������ն˰������εĶԱ�
clc;
clear;

csi_trace1 = read_bf_file('./5_18_data/5_18_w/p3_464646_click.dat'); % �����ļ�·��
csi_trace2 = read_bf_file('./5_18_data/5_18_z/p3_464646_click.dat');
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

figure;
sgtitle('���ز�16 ratio����');
subplot(3,2,1);
hold on;
plot(REV1_abs_ratio_r1r2(16,:),'r');
plot(REV2_abs_ratio_r1r2(16,:),'b');
hold off;
set(gca,'FontWeight','bold');
title('��������-1��2     �����','FontWeight','bold','FontSize',14);
xlabel('CSI Packet index');
ylabel('Value');
subplot(3,2,2);
hold on;
plot(REV1_phase_ratio_r1r2(16,:),'r');
plot(REV2_phase_ratio_r1r2(16,:),'b');
hold off;
set(gca,'FontWeight','bold');
title('��������-1��2     ��λ��','FontWeight','bold','FontSize',14);
xlabel('CSI Packet index');
ylabel('Value');
subplot(3,2,3);
hold on;
plot(REV1_abs_ratio_r1r3(16,:),'r');
plot(REV2_abs_ratio_r1r3(16,:),'b');
hold off;
set(gca,'FontWeight','bold');
title('��������-1��3     �����','FontWeight','bold','FontSize',14);
xlabel('CSI Packet index');
ylabel('Value');
subplot(3,2,4);
hold on;
plot(REV1_phase_ratio_r1r3(16,:),'r');
plot(REV2_phase_ratio_r1r3(16,:),'b');
hold off;
set(gca,'FontWeight','bold');
title('��������-1��3     ��λ��','FontWeight','bold','FontSize',14);
xlabel('CSI Packet index');
ylabel('Value');
subplot(3,2,5);
hold on;
plot(REV1_abs_ratio_r2r3(16,:),'r');
plot(REV2_abs_ratio_r2r3(16,:),'b');
hold off;
set(gca,'FontWeight','bold');
title('��������-2��3     �����','FontWeight','bold','FontSize',14);
xlabel('CSI Packet index');
ylabel('Value');
subplot(3,2,6);
hold on;
plot(REV1_phase_ratio_r2r3(16,:),'r');
plot(REV2_phase_ratio_r2r3(16,:),'b');
hold off;
set(gca,'FontWeight','bold');
title('��������-2��3     ��λ��','FontWeight','bold','FontSize',14);
xlabel('CSI Packet index');
ylabel('Value');