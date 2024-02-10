%% 7��22�ա����������ֻ�Լ���λ�õ�����ѵ��������λ�ò�ѵ�������ԣ�Ч������
clc;
clear;

csi_trace1 = read_bf_file('./data0704/0704W/loc5_p666666_1.dat'); % �����ļ�·��
csi_trace2 = read_bf_file('./data0704/0704Z/loc5_p666666_1.dat');

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

% figure;
% subplot(2,1,1);
% plot(abs(REV1_t1_r1(1,:)));
% subplot(2,1,2);
% plot(abs(REV2_t1_r1(1,:)));

%% �õ���������
REV1_ratio_r1r2 = REV1_t1_r1./REV1_t1_r2;
REV1_ratio_r1r3 = REV1_t1_r1./REV1_t1_r3;
REV1_ratio_r2r3 = REV1_t1_r2./REV1_t1_r3;

REV2_ratio_r1r2 = REV2_t1_r1./REV2_t1_r2;
REV2_ratio_r1r3 = REV2_t1_r1./REV2_t1_r3;
REV2_ratio_r2r3 = REV2_t1_r2./REV2_t1_r3;

filter_REV1_ratio_r1r2 = func_sg(REV1_ratio_r1r2);
filter_REV1_ratio_r1r3 = func_sg(REV1_ratio_r1r3);
filter_REV1_ratio_r2r3 = func_sg(REV1_ratio_r2r3);
filter_REV2_ratio_r1r2 = func_sg(REV2_ratio_r1r2);
filter_REV2_ratio_r1r3 = func_sg(REV2_ratio_r1r3);
filter_REV2_ratio_r2r3 = func_sg(REV2_ratio_r2r3);


feature_num = 60;
start_index = 7597;
end_index = 8776;
sub_carrier = 16;
mean_num = floor((end_index-start_index)./(feature_num+1));

mean_REV1_r1r2 = fun_mean_num_complex(filter_REV1_ratio_r1r2(sub_carrier,start_index:end_index),mean_num);
mean_REV1_r1r3 = fun_mean_num_complex(filter_REV1_ratio_r1r3(sub_carrier,start_index:end_index),mean_num);
mean_REV1_r2r3 = fun_mean_num_complex(filter_REV1_ratio_r2r3(sub_carrier,start_index:end_index),mean_num);

mean_REV2_r1r2 = fun_mean_num_complex(filter_REV2_ratio_r1r2(sub_carrier,start_index:end_index),mean_num);
mean_REV2_r1r3 = fun_mean_num_complex(filter_REV2_ratio_r1r3(sub_carrier,start_index:end_index),mean_num);
mean_REV2_r2r3 = fun_mean_num_complex(filter_REV2_ratio_r2r3(sub_carrier,start_index:end_index),mean_num);

figure;
subplot(2,1,1);
plot(mean_REV1_r1r2,'o','Color',[0.13,0.54,0.13],'MarkerFaceColor',[0.69,0.13,0.13],'MarkerSize',6);
text_c = string(1:length(mean_REV1_r1r2));
text(real(mean_REV1_r1r2),imag(mean_REV1_r1r2),text_c,'FontSize',12);
set(gca,'FontWeight','bold');
title('REV1--Complex','FontWeight','bold','FontSize',14);
subplot(2,1,2);
plot(mean_REV2_r1r2,'o','Color',[0.13,0.54,0.13],'MarkerFaceColor',[0.39,0.58,0.93],'MarkerSize',6);
text_c = string(1:length(mean_REV2_r1r2));
text(real(mean_REV2_r1r2),imag(mean_REV2_r1r2),text_c,'FontSize',12);
set(gca,'FontWeight','bold');
title('REV2--Complex','FontWeight','bold','FontSize',14);

abs_mean_REV1_r1r2 = abs(mean_REV1_r1r2);
angle_mean_REV1_r1r2 = angle(mean_REV1_r1r2);
figure;
subplot(2,1,1);
plot(abs_mean_REV1_r1r2);
subplot(2,1,2);
plot(angle_mean_REV1_r1r2);

abs_mean_REV2_r1r2 = abs(mean_REV2_r1r2);
angle_mean_REV2_r1r2 = angle(mean_REV2_r1r2);
figure;
subplot(2,1,1);
plot(abs_mean_REV2_r1r2);
subplot(2,1,2);
plot(angle_mean_REV2_r1r2);

mean_REV1_r1r2 = fun_mean_num_complex(mean_REV1_r1r2,3);
mean_REV2_r1r2 = fun_mean_num_complex(mean_REV2_r1r2,3);

figure;
subplot(2,1,1);
plot(mean_REV1_r1r2,'o','Color',[0.13,0.54,0.13],'MarkerFaceColor',[0.69,0.13,0.13],'MarkerSize',6);
text_c = string(1:length(mean_REV1_r1r2));
text(real(mean_REV1_r1r2),imag(mean_REV1_r1r2),text_c,'FontSize',12);
set(gca,'FontWeight','bold');
title('REV1--Complex','FontWeight','bold','FontSize',14);
subplot(2,1,2);
plot(mean_REV2_r1r2,'o','Color',[0.13,0.54,0.13],'MarkerFaceColor',[0.39,0.58,0.93],'MarkerSize',6);
text_c = string(1:length(mean_REV2_r1r2));
text(real(mean_REV2_r1r2),imag(mean_REV2_r1r2),text_c,'FontSize',12);
set(gca,'FontWeight','bold');
title('REV2--Complex','FontWeight','bold','FontSize',14);

abs_mean_REV1_r1r2 = abs(mean_REV1_r1r2);
angle_mean_REV1_r1r2 = angle(mean_REV1_r1r2);
figure;
subplot(2,1,1);
plot(abs_mean_REV1_r1r2);
subplot(2,1,2);
plot(angle_mean_REV1_r1r2);

%% ��չmean�ĳ�������Ӧ֮���������
% mean_REV1_r1r2 = interp1(mean_REV1_r1r2,1:feature_num+2);
% mean_REV1_r1r3 = interp1(mean_REV1_r1r3,1:feature_num+2);
% mean_REV1_r2r3 = interp1(mean_REV1_r2r3,1:feature_num+2);
% 
% mean_REV2_r1r2 = interp1(mean_REV2_r1r2,1:feature_num+2);
% mean_REV2_r1r3 = interp1(mean_REV2_r1r3,1:feature_num+2);
% mean_REV2_r2r3 = interp1(mean_REV2_r2r3,1:feature_num+2);

feature_REV1_r1r2 = fun_calc_rotefeature5(mean_REV1_r1r2);
% feature_REV1_r1r3 = fun_calc_rotefeature5(mean_REV1_r1r3);
% feature_REV1_r2r3 = fun_calc_rotefeature5(mean_REV1_r2r3);

feature_REV2_r1r2 = fun_calc_rotefeature5(mean_REV2_r1r2);
% feature_REV2_r1r3 = fun_calc_rotefeature5(mean_REV2_r1r3);
% feature_REV2_r2r3 = fun_calc_rotefeature5(mean_REV2_r2r3);

figure;
subplot(2,1,1);
plot(feature_REV1_r1r2,'ro');
hold on;
plot(zeros(length(feature_REV1_r1r2)),'LineWidth',2);
hold off;
set(gca,'FontWeight','bold');
title('Rev1-R1R2�����˶������ж�','FontWeight','bold','FontSize',14);

subplot(2,1,2);
plot(feature_REV2_r1r2,'bo');
hold on;
plot(zeros(length(feature_REV2_r1r2)),'LineWidth',2);
hold off;
set(gca,'FontWeight','bold');
title('Rev2-R1R2�����˶������ж�','FontWeight','bold','FontSize',14);



%% ȥ���м䲿��
REV1_delete_middle = [feature_REV1_r1r2(1:20),feature_REV1_r1r2(40:end)];
REV2_delete_middle = [feature_REV2_r1r2(1:20),feature_REV2_r1r2(40:end)];

figure;
subplot(2,1,1);
plot(REV1_delete_middle,'ro');
hold on;
plot(zeros(length(REV1_delete_middle)),'LineWidth',2);
hold off;
set(gca,'FontWeight','bold');
title('Rev1-R1R2�����˶������ж�','FontWeight','bold','FontSize',14);

subplot(2,1,2);
plot(REV2_delete_middle,'bo');
hold on;
plot(zeros(length(REV2_delete_middle)),'LineWidth',2);
hold off;
set(gca,'FontWeight','bold');
title('Rev2-R1R2�����˶������ж�','FontWeight','bold','FontSize',14);