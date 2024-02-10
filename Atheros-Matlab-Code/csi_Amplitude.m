clc;
clear;
%% ���ȴ������
csi_trace = read_log_file('./data/move10.dat');%ָ����ȡ�������ļ�
% csi_trace = fun_delete_zeroCSI(csi_trace);
csi_trace = csi_trace(20:end);
L = length(csi_trace);

csi_Amp = zeros(56,L);
csi_revise_Amp = zeros(56,L);
for i=1:length(csi_trace)
     for j = 1:56
         csi_entry = csi_trace{i};
         csi = csi_entry.csi;
         csi1 = csi(2,1,j);%ѡȡ���߶�
         csi2 = csi(2,2,j);%ѡȡ���߶�
         csi12 = csi1./csi2;
         csi_Amp1(j,i) = db(abs(csi1));%��ȡ����ֵ  
         csi_Amp2(j,i) = db(abs(csi2));%��ȡ����ֵ  
         csi_ratio(j,i) = db(abs(csi12));
     end
end

figure;
plot(csi_Amp1.');
figure;
plot(csi_Amp2.');
figure;
plot(csi_ratio.');

figure;
plot(csi_ratio(16,:));

csi_amp = csi_Amp.';
csi_revise_amp = [];
% for i = 1:56
%     [Mdl,tf(:,i),scores(:,i)] = iforest(csi_amp(:,i),ContaminationFraction=0.05);
%     mean_value = mean(csi_amp(:,i));
%     outlier = find(tf(:,i) == 1);
%     csi = csi_amp(:,i);
%     csi(outlier) = mean_value;
%     csi_revise_amp = [csi_revise_amp,csi];
% %     histogram(scores);
% %     xline(Mdl.ScoreThreshold,"r-",join(["Threshold" Mdl.ScoreThreshold]));
% end
% csi_revise_amp = csi_revise_amp.';
% figure(1);
% subplot(2,1,1);
% outlier = find(tf == 1);
% title('Subcarrier 1');
% xlabel('Packets Index');
% ylabel('CSI Amplitude');
% hold on;
% plot(csi_amp(:,1));
% plot(outlier,csi_amp(outlier,1),'o');
% xlim([0 1100]);
% ylim([34 48]);
% hold off;
% subplot(2,1,2);
% csi = csi_amp(:,1);
% csi(outlier) = [];
% plot(csi);
% xlim([0 1100]);
% ylim([34 48]);
% hold off;

[after_hampel_Amplitude,l] = Use_hampel(csi_Amp);%Hampel�˲�ȥ���쳣ֵ
% restruct_sub_Amplitude = Use_butter(after_hampel_Amplitude);%������˹�˲���ķ�������
for j = 1:56
    [d,a]=wavedec(csi_revise_amp(j,:),3,'db4');           %��ԭʼ�źŽ���3����ɢС���ֽ�
    a3=wrcoef('a',d,a,'db4',3);         %�ع���3�����ϵ��
    csi_revise_Amp(j,:) = a3;

    [d1,a1]=wavedec(after_hampel_Amplitude(j,:),3,'db4');           %��ԭʼ�źŽ���3����ɢС���ֽ�
    a31=wrcoef('a',d1,a1,'db4',3);         %�ع���3�����ϵ��
    csi_revise_Amp2(j,:) = a31;
end
% figure(1);
% subplot(2,1,2)
% outlier1 = find(l(1,:) == 1);
% title('Subcarrier 1');
% xlabel('Packets Index');
% ylabel('CSI Amplitude');
% hold on;
% plot(csi_Amp(1,:));
% plot(outlier1,csi_Amp(1,outlier1),'o');
% xlim([0 1100]);
% ylim([34 48]);
% hold off;
% 
% 
% figure(1);
% subplot(2,2,1);
% outlier1 = find(l(10,1:200) == 1);
% title('Subcarrier 10');
% xlabel('Packets Index');
% ylabel('CSI Amplitude');
% hold on;
% plot(after_hampel_Amplitude(10,1:200),'.');
% plot(outlier1,after_hampel_Amplitude(10,outlier1),'o');
% hold off;
% legend('Raw data','Outlier','Location','SouthEastoutside');
% subplot(2,2,2)
% outlier2 = find(l(20,1:200) == 1);
% title('Subcarrier 20');
% xlabel('Packets Index');
% ylabel('CSI Amplitude');
% hold on;
% plot(after_hampel_Amplitude(20,1:200),'.');
% plot(outlier2,after_hampel_Amplitude(20,outlier2),'o');
% hold off;
% legend('Raw data','Outlier','Location','SouthEastoutside');
% subplot(2,2,3)
% outlier3 = find(l(30,1:200) == 1);
% title('Subcarrier 30');
% xlabel('Packets Index');
% ylabel('CSI Amplitude');
% hold on;
% plot(after_hampel_Amplitude(30,1:200),'.');
% plot(outlier3,after_hampel_Amplitude(30,outlier3),'o');
% hold off;
% legend('Raw data','Outlier','Location','SouthEastoutside');
% subplot(2,2,4)
% outlier4 = find(l(40,1:200) == 1);
% title('Subcarrier 40');
% xlabel('Packets Index');
% ylabel('CSI Amplitude');
% hold on;
% plot(after_hampel_Amplitude(40,1:200),'.');
% plot(outlier4,after_hampel_Amplitude(40,outlier4),'o');
% hold off;
% legend('Raw data','Outlier','Location','SouthEastoutside');

figure(2);
subplot(3,1,1);
outlier = find(tf(:,20) == 1);
hold on;
plot(csi_Amp(20,:));
plot(outlier,csi_Amp(20,outlier),'o');
title('ԭʼ����ͼ')
xlabel('Packets Index');
ylabel('CSI Amplitude');

subplot(3,1,2);
hold on;
plot(after_hampel_Amplitude(20,:));
plot(csi_revise_amp(20,:));
title('Hampel�˲������ͼ')
xlabel('Packets Index');
ylabel('CSI Amplitude');

subplot(3,1,3);
hold on;
plot(csi_revise_Amp(20,:));
plot(csi_revise_Amp2(20,:));
title('Ԥ������̶Ա�ͼ')
xlabel('Packets Index');
ylabel('CSI Amplitude');
legend('����ɭ��','hampel�˲�','Location','SouthEastoutside');


figure;
title('ԭʼ���ز�����ͼ')
xlabel('Subcarrier Index');
ylabel('CSI Amplitude');
hold on;
plot(csi_Amp(:,30));
plot(csi_revise_amp(:,30));
plot(csi_revise_Amp(:,30));
plot(csi_revise_Amp2(:,30));
hold off;
legend('Raw data','after iforest','after dwt','after hampel and DWT','Location','SouthEastoutside');

% figure(4);
% subplot(3,1,1);
% mesh(1:56,1:400,csi_Amp(:,1:400).');
% title('ԭʼ��ά����ͼ')
% xlabel('Subcarrier Index');
% ylabel('Packet Index');
% zlabel('CSI Amplitude');
% subplot(3,1,2);
% mesh(1:56,1:400,after_hampel_Amplitude(:,1:400).');
% title('hampel�˲�����ά����ͼ')
% xlabel('Subcarrier Index');
% ylabel('Packet Index');
% zlabel('CSI Amplitude');                    
% subplot(3,1,3);
% mesh(1:56,1:400,restruct_sub_Amplitude(:,1:400).');
% title('������˹��ͨ�˲�����ά����ͼ')
% xlabel('Subcarrier Index');
% ylabel('Packet Index');
% zlabel('CSI Amplitude');