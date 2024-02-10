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

%�ϲ���ֵ�����͹�ֵ����
store_index = sort([locs;locs2]);
index_value = choose_data(store_index,:);

diff_index_value = diff(index_value);

figure;
pspectrum(choose_data,1000,'spectrogram','FrequencyLimits',[0,10],'TimeResolution',0.1,...
'MinTHreshold',-10)

[cfs,f]=cwt(choose_data,1000);   %�����������ͼ��morse  bump  amor  ������100
figure;      
cwt(choose_data,1000);           %ֱ�ӻ�ͼ
colormap('jet');                    %���ó�����ͼ
T1 = 0.01;   T2 = 7.7;   F1=1;
t = 0.001:0.001:length(choose_data)/1000;  %100������
cfs(f<F1,t>=0.001)=0;      %�˳�С��0.1����0.3Ƶ�ʵĲ�
xrec=icwt(cfs);                     %������任
figure;
cwt(xrec,100);                      %�����˳��������ͼ
colormap('jet');
figure;                         %�����˳���Ĳ���ͼ
plot(t,xrec);





figure;
x = final_keypair(1,1):final_keypair(1,2);
subplot(3,2,1);
plot(x-final_keypair(1,1)+1, REV1_first_abs_csi(x),'LineWidth',2,'Color',[0.69,0.13,0.13]);
set(gca,'FontWeight','bold');
title('��һ�ΰ���-REV1�������','FontWeight','bold','FontSize',14);
subplot(3,2,2);
plot(x-final_keypair(1,1)+1, REV2_first_abs_csi(x),'LineWidth',2,'Color',[0.39,0.58,0.93]);
set(gca,'FontWeight','bold');
title('��һ�ΰ���-REV2�������','FontWeight','bold','FontSize',14);

x = final_keypair(2,1):final_keypair(2,2);
subplot(3,2,3);
plot(x-final_keypair(2,1)+1, REV1_first_abs_csi(x),'LineWidth',2,'Color',[0.69,0.13,0.13]);
set(gca,'FontWeight','bold');
title('�ڶ��ΰ���-REV1�������','FontWeight','bold','FontSize',14);
subplot(3,2,4);
plot(x-final_keypair(2,1)+1, REV2_first_abs_csi(x),'LineWidth',2,'Color',[0.39,0.58,0.93]);
set(gca,'FontWeight','bold');
title('�ڶ��ΰ���-REV2�������','FontWeight','bold','FontSize',14);

x = final_keypair(3,1):final_keypair(3,2);
subplot(3,2,5);
plot(x-final_keypair(3,1)+1, REV1_first_abs_csi(x),'LineWidth',2,'Color',[0.69,0.13,0.13]);
set(gca,'FontWeight','bold');
title('�����ΰ���-REV1�������','FontWeight','bold','FontSize',14);
subplot(3,2,6);
plot(x-final_keypair(3,1)+1, REV2_first_abs_csi(x),'LineWidth',2,'Color',[0.39,0.58,0.93]);
set(gca,'FontWeight','bold');
title('�����ΰ���-REV2�������','FontWeight','bold','FontSize',14);

sgtitle('Loc5����9��������','FontSize',20);




figure;
subplot(3,2,1);
plot(allkey_feature_REV1_r1r2(1,:),'o','Color',[0.13,0.54,0.13],'MarkerFaceColor',[0.69,0.13,0.13],'MarkerSize',8);
hold on;
plot(zeros(length(allkey_feature_REV1_r1r2(1,:))),'LineWidth',2,'Color',[0.13,0.54,0.13]);
hold off;
set(gca,'FontWeight','bold');
title('��һ�ΰ���Rev1�����˶�����','FontWeight','bold','FontSize',14);

subplot(3,2,2);
plot(allkey_feature_REV2_r1r2(1,:),'o','Color',[0.13,0.54,0.13],'MarkerFaceColor',[0.39,0.58,0.93],'MarkerSize',8);
hold on;
plot(zeros(length(allkey_feature_REV2_r1r2(1,:))),'LineWidth',2,'Color',[0.13,0.54,0.13]);
hold off;
set(gca,'FontWeight','bold');
title('��һ�ΰ���Rev2�����˶�����','FontWeight','bold','FontSize',14);

subplot(3,2,3);
plot(allkey_feature_REV1_r1r2(2,:),'o','Color',[0.13,0.54,0.13],'MarkerFaceColor',[0.69,0.13,0.13],'MarkerSize',8);
hold on;
plot(zeros(length(allkey_feature_REV1_r1r2(2,:))),'LineWidth',2,'Color',[0.13,0.54,0.13]);
hold off;
set(gca,'FontWeight','bold');
title('�ڶ��ΰ���Rev1�����˶�����','FontWeight','bold','FontSize',14);

subplot(3,2,4);
plot(allkey_feature_REV2_r1r2(2,:),'o','Color',[0.13,0.54,0.13],'MarkerFaceColor',[0.39,0.58,0.93],'MarkerSize',8);
hold on;
plot(zeros(length(allkey_feature_REV2_r1r2(2,:))),'LineWidth',2,'Color',[0.13,0.54,0.13]);
hold off;
set(gca,'FontWeight','bold');
title('�ڶ��ΰ���Rev2�����˶�����','FontWeight','bold','FontSize',14);

subplot(3,2,5);
plot(allkey_feature_REV1_r1r2(3,:),'o','Color',[0.13,0.54,0.13],'MarkerFaceColor',[0.69,0.13,0.13],'MarkerSize',8);
hold on;
plot(zeros(length(allkey_feature_REV1_r1r2(3,:))),'LineWidth',2,'Color',[0.13,0.54,0.13]);
hold off;
set(gca,'FontWeight','bold');
title('�����ΰ���Rev1�����˶�����','FontWeight','bold','FontSize',14);

subplot(3,2,6);
plot(allkey_feature_REV2_r1r2(3,:),'o','Color',[0.13,0.54,0.13],'MarkerFaceColor',[0.39,0.58,0.93],'MarkerSize',8);
hold on;
plot(zeros(length(allkey_feature_REV2_r1r2(3,:))),'LineWidth',2,'Color',[0.13,0.54,0.13]);
hold off;
set(gca,'FontWeight','bold');
title('�����ΰ���Rev2�����˶�����','FontWeight','bold','FontSize',14);

sgtitle('Loc5����9�����˶�����','FontSize',20);