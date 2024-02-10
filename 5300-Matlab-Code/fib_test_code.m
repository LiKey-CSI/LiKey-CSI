%% 4��4�ղ��Դ��롪��չʾ��������ʵ��ʵ��Ч��
% ��ʾ�̶����ز���Ӧ��������κ���λ����
clc;
clear;

csi_trace = read_bf_file('./5_11/REV_W/p1_111111.dat'); % �����ļ�·��
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


imag_csi_t1_r1 = imag(csi_t1_r1);
real_csi_t1_r1 = real(csi_t1_r1);
imag_csi_t1_r2 = imag(csi_t1_r2);
real_csi_t1_r2 = real(csi_t1_r2);
imag_csi_t1_r3 = imag(csi_t1_r3);
real_csi_t1_r3 = real(csi_t1_r3);

figure;
plot(real_csi_t1_r1(16,94:156),imag_csi_t1_r1(16,94:156));
hold on;
plot(real_csi_t1_r2(16,94:156),imag_csi_t1_r2(16,94:156));
plot(real_csi_t1_r3(16,94:156),imag_csi_t1_r3(16,94:156));
% plot(csi_t1_r1(1,1),'o');

%�õ��������
abs_t1_r1 = abs(csi_t1_r1);
abs_t1_r2 = abs(csi_t1_r2);
abs_t1_r3 = abs(csi_t1_r3);

% figure;
% plot(abs_t1_r1(16,:));


%% ��λ���ݴ���ԭʼ��λ+�����+���Ա仯
raw_phase_t1_r1 = angle(csi_t1_r1);
raw_phase_t1_r2 = angle(csi_t1_r2);
raw_phase_t1_r3 = angle(csi_t1_r3);

%�����
unwrap_t1_r1 = unwrap(raw_phase_t1_r1);
unwrap_t1_r2 = unwrap(raw_phase_t1_r2);
unwrap_t1_r3 = unwrap(raw_phase_t1_r3);

%���Ա仯
linear_phase_t1_r1 = func_linear_phase(unwrap_t1_r1);
linear_phase_t1_r2 = func_linear_phase(unwrap_t1_r2);
linear_phase_t1_r3 = func_linear_phase(unwrap_t1_r3);

% %�۲���λ�仯�Ĺ���
% %�������ز�
% figure;
% subplot(3,1,1);
% plot(raw_phase_t1_r2.');
% subplot(3,1,2);
% plot(unwrap_t1_r2.');
% subplot(3,1,3);
% plot(linear_phase_t1_r2.');
% 
% figure;
% subplot(3,1,1);
% plot(raw_phase_t1_r2);
% subplot(3,1,2);
% plot(unwrap_t1_r2);
% subplot(3,1,3);
% plot(linear_phase_t1_r2);

%ȥ���������λ�쳣ֵ
hampel_abs_t1_r1 = Use_hampel(abs_t1_r1);
hampel_abs_t1_r2 = Use_hampel(abs_t1_r2);
hampel_abs_t1_r3 = Use_hampel(abs_t1_r3);

hampel_phase_t1_r1 = Use_hampel(linear_phase_t1_r1);
hampel_phase_t1_r2 = Use_hampel(linear_phase_t1_r2);
hampel_phase_t1_r3 = Use_hampel(linear_phase_t1_r3);

%���������λ����Savitzky-Golay�˲�
sg_abs_t1_r1 = func_sg(hampel_abs_t1_r1);
sg_abs_t1_r2 = func_sg(hampel_abs_t1_r2);
sg_abs_t1_r3 = func_sg(hampel_abs_t1_r3);

sg_phase_t1_r1 = func_sg(hampel_phase_t1_r1);
sg_phase_t1_r2 = func_sg(hampel_phase_t1_r2);
sg_phase_t1_r3 = func_sg(hampel_phase_t1_r3);


%��16�����ز�
figure;
sgtitle('���ز�16 ��������');
subplot(3,1,1);
plot(sg_abs_t1_r1(16,:));
set(gca,'FontWeight','bold');
title('��������-1   ��������-1','FontWeight','bold','FontSize',14);
xlabel('CSI Packet index');
ylabel('Amplitude Value');
subplot(3,1,2);
plot(sg_abs_t1_r2(16,:));
set(gca,'FontWeight','bold');
title('��������-1   ��������-2','FontWeight','bold','FontSize',14);
xlabel('CSI Packet index');
ylabel('Amplitude Value');
subplot(3,1,3);
plot(sg_abs_t1_r3(16,:));
set(gca,'FontWeight','bold');
title('��������-1   ��������-3','FontWeight','bold','FontSize',14);
xlabel('CSI Packet index');
ylabel('Amplitude Value');

figure;
sgtitle('���ز�16 ��λ����');
subplot(3,1,1);
plot(sg_phase_t1_r1(16,:));
set(gca,'FontWeight','bold');
title('��������-1   ��������-1','FontWeight','bold','FontSize',14);
xlabel('CSI Packet index');
ylabel('Phase Value');
subplot(3,1,2);
plot(sg_phase_t1_r2(16,:));
set(gca,'FontWeight','bold');
title('��������-1   ��������-2','FontWeight','bold','FontSize',14);
xlabel('CSI Packet index');
ylabel('Phase Value');
subplot(3,1,3);
plot(sg_phase_t1_r3(16,:));
set(gca,'FontWeight','bold');
title('��������-1   ��������-3','FontWeight','bold','FontSize',14);
xlabel('CSI Packet index');
ylabel('Phase Value');


%��ֵ���ع�
complex_t1_r1 = sg_abs_t1_r1(16,:).*exp(1i*sg_phase_t1_r1(16,:));
complex_t1_r2 = sg_abs_t1_r2(16,:).*exp(1i*sg_phase_t1_r2(16,:));
complex_t1_r3 = sg_abs_t1_r3(16,:).*exp(1i*sg_phase_t1_r3(16,:));
figure;
plot(complex_t1_r1(94:156));
hold on;
plot(complex_t1_r2(94:156));
plot(complex_t1_r3(94:156));