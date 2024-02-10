choose_data = REV1_first_abs_csi;
choose_data = (choose_data-min(choose_data))./(max(choose_data)-min(choose_data));

choose_data = smoothdata(choose_data,'gaussian',250);

[pks,locs] = findpeaks(choose_data);

neg_choose_data = 1 - choose_data;
[pks2,locs2] = findpeaks(neg_choose_data);


figure;
plot(choose_data);
hold on;
plot(locs,choose_data(locs,:),'ro');
plot(locs2,choose_data(locs2,:),'go');
hold off;

%合并峰值索引和谷值索引
store_index = sort([locs;locs2]);
index_value = choose_data(store_index,:);

diff_index_value = diff(index_value);

figure;
pspectrum(choose_data,1000,'spectrogram','FrequencyLimits',[0,10],'TimeResolution',0.1,...
'MinTHreshold',-10)

[cfs,f]=cwt(choose_data,1000);   %有输出，不画图，morse  bump  amor  采样率100
figure;      
cwt(choose_data,1000);           %直接画图
colormap('jet');                    %设置成热力图
T1 = 0.01;   T2 = 7.7;   F1=1;
t = 0.001:0.001:length(choose_data)/1000;  %100采样率
cfs(f<F1,t>=0.001)=0;      %滤除小于0.1大于0.3频率的波
xrec=icwt(cfs);                     %进行逆变换
figure;
cwt(xrec,100);                      %绘制滤除后的热力图
colormap('jet');
figure;                         %绘制滤除后的波形图
plot(t,xrec);





figure;
x = final_keypair(1,1):final_keypair(1,2);
subplot(3,2,1);
plot(x-final_keypair(1,1)+1, REV1_first_abs_csi(x),'LineWidth',2,'Color',[0.69,0.13,0.13]);
set(gca,'FontWeight','bold');
title('第一次按键-REV1振幅波形','FontWeight','bold','FontSize',14);
subplot(3,2,2);
plot(x-final_keypair(1,1)+1, REV2_first_abs_csi(x),'LineWidth',2,'Color',[0.39,0.58,0.93]);
set(gca,'FontWeight','bold');
title('第一次按键-REV2振幅波形','FontWeight','bold','FontSize',14);

x = final_keypair(2,1):final_keypair(2,2);
subplot(3,2,3);
plot(x-final_keypair(2,1)+1, REV1_first_abs_csi(x),'LineWidth',2,'Color',[0.69,0.13,0.13]);
set(gca,'FontWeight','bold');
title('第二次按键-REV1振幅波形','FontWeight','bold','FontSize',14);
subplot(3,2,4);
plot(x-final_keypair(2,1)+1, REV2_first_abs_csi(x),'LineWidth',2,'Color',[0.39,0.58,0.93]);
set(gca,'FontWeight','bold');
title('第二次按键-REV2振幅波形','FontWeight','bold','FontSize',14);

x = final_keypair(3,1):final_keypair(3,2);
subplot(3,2,5);
plot(x-final_keypair(3,1)+1, REV1_first_abs_csi(x),'LineWidth',2,'Color',[0.69,0.13,0.13]);
set(gca,'FontWeight','bold');
title('第三次按键-REV1振幅波形','FontWeight','bold','FontSize',14);
subplot(3,2,6);
plot(x-final_keypair(3,1)+1, REV2_first_abs_csi(x),'LineWidth',2,'Color',[0.39,0.58,0.93]);
set(gca,'FontWeight','bold');
title('第三次按键-REV2振幅波形','FontWeight','bold','FontSize',14);

sgtitle('Loc5按键9波形特征','FontSize',20);




figure;
subplot(3,2,1);
plot(allkey_feature_REV1_r1r2(1,:),'o','Color',[0.13,0.54,0.13],'MarkerFaceColor',[0.69,0.13,0.13],'MarkerSize',8);
hold on;
plot(zeros(length(allkey_feature_REV1_r1r2(1,:))),'LineWidth',2,'Color',[0.13,0.54,0.13]);
hold off;
set(gca,'FontWeight','bold');
title('第一次按键Rev1复数运动特征','FontWeight','bold','FontSize',14);

subplot(3,2,2);
plot(allkey_feature_REV2_r1r2(1,:),'o','Color',[0.13,0.54,0.13],'MarkerFaceColor',[0.39,0.58,0.93],'MarkerSize',8);
hold on;
plot(zeros(length(allkey_feature_REV2_r1r2(1,:))),'LineWidth',2,'Color',[0.13,0.54,0.13]);
hold off;
set(gca,'FontWeight','bold');
title('第一次按键Rev2复数运动特征','FontWeight','bold','FontSize',14);

subplot(3,2,3);
plot(allkey_feature_REV1_r1r2(2,:),'o','Color',[0.13,0.54,0.13],'MarkerFaceColor',[0.69,0.13,0.13],'MarkerSize',8);
hold on;
plot(zeros(length(allkey_feature_REV1_r1r2(2,:))),'LineWidth',2,'Color',[0.13,0.54,0.13]);
hold off;
set(gca,'FontWeight','bold');
title('第二次按键Rev1复数运动特征','FontWeight','bold','FontSize',14);

subplot(3,2,4);
plot(allkey_feature_REV2_r1r2(2,:),'o','Color',[0.13,0.54,0.13],'MarkerFaceColor',[0.39,0.58,0.93],'MarkerSize',8);
hold on;
plot(zeros(length(allkey_feature_REV2_r1r2(2,:))),'LineWidth',2,'Color',[0.13,0.54,0.13]);
hold off;
set(gca,'FontWeight','bold');
title('第二次按键Rev2复数运动特征','FontWeight','bold','FontSize',14);

subplot(3,2,5);
plot(allkey_feature_REV1_r1r2(3,:),'o','Color',[0.13,0.54,0.13],'MarkerFaceColor',[0.69,0.13,0.13],'MarkerSize',8);
hold on;
plot(zeros(length(allkey_feature_REV1_r1r2(3,:))),'LineWidth',2,'Color',[0.13,0.54,0.13]);
hold off;
set(gca,'FontWeight','bold');
title('第三次按键Rev1复数运动特征','FontWeight','bold','FontSize',14);

subplot(3,2,6);
plot(allkey_feature_REV2_r1r2(3,:),'o','Color',[0.13,0.54,0.13],'MarkerFaceColor',[0.39,0.58,0.93],'MarkerSize',8);
hold on;
plot(zeros(length(allkey_feature_REV2_r1r2(3,:))),'LineWidth',2,'Color',[0.13,0.54,0.13]);
hold off;
set(gca,'FontWeight','bold');
title('第三次按键Rev2复数运动特征','FontWeight','bold','FontSize',14);

sgtitle('Loc5按键9复数运动特征','FontSize',20);