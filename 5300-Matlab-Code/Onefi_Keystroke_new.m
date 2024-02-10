%% ����ʹ��OneFi�еĴ�����̶԰������ݽ��д���
clear;
clc;

csi_trace = read_bf_file('./5_11/REV_W/p3_171717.dat'); % �����ļ�·��
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
csi_data = [csi_t1_r1;csi_t1_r2;csi_t1_r3].';
figure;
hold on;
plot(abs(csi_data(:,1)));
plot(abs(csi_data(:,2)));
% plot(abs(csi_data));
hold off;

%% ���ȴ�ÿ�����ز���CSI��ȥ��ֱ��ƫ��
corrected_csi = remove_dc_offset(csi_data);
figure;
hold on;
plot(abs(corrected_csi(:,1)));
plot(abs(corrected_csi(:,2)));
% plot(abs(corrected_csi));
hold off;

%% ���ù���˷�������λƫ��
corrected_csi = remove_phase_offset(corrected_csi);
figure;
hold on;
plot(abs(corrected_csi(:,1)));
plot(abs(corrected_csi(:,2)));
%plot(abs(corrected_csi));
hold off;

%% ʹ�ø�ͨ�˲�ȥ����̬���� ��ͨ�˲�ȥ����Ƶ����
corrected_csi = remove_dc_and_noise(corrected_csi,100,2,20);
figure;
hold on;
plot(abs(corrected_csi(:,1)));
plot(abs(corrected_csi(:,2)));
% plot(abs(corrected_csi));
hold off;

%% �������ɷַ���
pca_csi = perform_pca(corrected_csi);
figure;
hold on;
plot(abs(pca_csi.principal_components(:,1)));
plot(abs(pca_csi.principal_components(:,1)));
hold off;