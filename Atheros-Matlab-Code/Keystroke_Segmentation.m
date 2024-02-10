%% 进行按键的分割 —— 相位振幅联合优化分割算法

%% 预处理后得到的数据为
Rev1_abs = abs_Rev1_ratio_t1t2_r2;
Rev1_phase = phase_Rev1_ratio_t1t2_r2;

Rev2_abs = abs_Rev2_ratio_t1t2_r2;
Rev2_phase = phase_Rev2_ratio_t1t2_r2;

%% 归一化处理
Rev1_abs = func_allNormalized(Rev1_abs);
Rev1_phase = func_allNormalized(Rev1_phase);
Rev2_abs = func_allNormalized(Rev2_abs);
Rev2_phase = func_allNormalized(Rev2_phase);

%% 进行PCA主成分分析
[COEFF1,SCORE1,latent1] = pca(Rev1_abs.');
explained1 = 100*latent1/sum(latent1);%计算贡献率
Rev1_first_abs = SCORE1(:,1);

[COEFF2,SCORE2,latent2] = pca(Rev1_phase.');
explained2 = 100*latent2/sum(latent2);%计算贡献率
Rev1_first_phase = SCORE2(:,1);

[COEFF3,SCORE3,latent3] = pca(Rev2_abs.');
explained3 = 100*latent3/sum(latent3);%计算贡献率
Rev2_first_abs = SCORE3(:,1);

[COEFF4,SCORE4,latent4] = pca(Rev2_phase.');
explained4 = 100*latent4/sum(latent4);%计算贡献率
Rev2_first_phase = SCORE4(:,1);

%% 展示主成分分析后的波形
figure;
subplot(2,1,1);
hold on;
plot(Rev1_first_abs,'r');
plot(Rev2_first_abs,'b');
legend("Rev1","Rev2");
hold off;
set(gca,'FontWeight','bold');
title('双接收机——振幅第一主成分','FontWeight','bold','FontSize',14);
xlabel('CSI Packet index');
ylabel('Value');

subplot(2,1,2);
hold on;
plot(Rev1_first_phase,'r');
plot(Rev2_first_phase,'b');
legend("Rev1","Rev2");
hold off;
set(gca,'FontWeight','bold');
title('双接收机——相位第一主成分','FontWeight','bold','FontSize',14);
xlabel('CSI Packet index');
ylabel('Value');

%% 得到每个一维数据的按键分割结果
Rev1_abs_keypair = func_split_keystroke(Rev1_first_abs,0.0045);
Rev1_phase_keypair = func_split_keystroke(Rev1_first_phase,0.016);
Rev2_abs_keypair = func_split_keystroke(Rev2_first_abs,0.01);
Rev2_phase_keypair = func_split_keystroke(Rev2_first_phase,0.0074);

% 剔除分割范围较大的数据
max_len = 2000;
copy_Rev1_abs_keypair = Rev1_abs_keypair;
copy_Rev1_phase_keypair = Rev1_phase_keypair;
copy_Rev2_abs_keypair = Rev2_abs_keypair;
copy_Rev2_phase_keypair = Rev2_phase_keypair;
for i = 1:length(Rev1_abs_keypair)
    if(Rev1_abs_keypair(i,2)-Rev1_abs_keypair(i,1))>2000
        copy_Rev1_abs_keypair(i,:) = [];
    end
end
for i = 1:length(Rev1_phase_keypair)
    if(Rev1_phase_keypair(i,2)-Rev1_phase_keypair(i,1))>2000
        copy_Rev1_phase_keypair(i,:) = [];
    end
end
for i = 1:length(Rev2_abs_keypair)
    if(Rev2_abs_keypair(i,2)-Rev2_abs_keypair(i,1))>2000
        copy_Rev2_abs_keypair(i,:) = [];
    end
end
for i = 1:length(Rev2_phase_keypair)
    if(Rev2_phase_keypair(i,2)-Rev2_phase_keypair(i,1))>2000
        copy_Rev2_phase_keypair(i,:) = [];
    end
end

Rev1_abs_keypair = copy_Rev1_abs_keypair;
Rev1_phase_keypair = copy_Rev1_phase_keypair;
Rev2_abs_keypair = copy_Rev2_abs_keypair;
Rev2_phase_keypair = copy_Rev2_phase_keypair;

figure;
subplot(4,1,1);
plot(Rev1_first_abs,'k');
hold on;
plot(Rev1_abs_keypair(:,1),Rev1_first_abs(Rev1_abs_keypair(:,1)),'ro');
line_range = [min(Rev1_first_abs) max(Rev1_first_abs)];
line([Rev1_abs_keypair(:,1),Rev1_abs_keypair(:,1)],line_range,'Color','r','Linewidth',1,'LineStyle','--');
plot(Rev1_abs_keypair(:,2),Rev1_first_abs(Rev1_abs_keypair(:,2)),'bo');
line([Rev1_abs_keypair(:,2),Rev1_abs_keypair(:,2)],line_range,'Color','b','Linewidth',1,'LineStyle','--');
hold off;
set(gca,'FontWeight','bold');
title('REV1--abs','FontWeight','bold','FontSize',14);
subplot(4,1,2);
plot(Rev1_first_phase,'k');
hold on;
plot(Rev1_phase_keypair(:,1),Rev1_first_phase(Rev1_phase_keypair(:,1)),'ro');
line_range = [min(Rev1_first_phase) max(Rev1_first_phase)];
line([Rev1_phase_keypair(:,1),Rev1_phase_keypair(:,1)],line_range,'Color','r','Linewidth',1,'LineStyle','--');
plot(Rev1_phase_keypair(:,2),Rev1_first_phase(Rev1_phase_keypair(:,2)),'bo');
line([Rev1_phase_keypair(:,2),Rev1_phase_keypair(:,2)],line_range,'Color','b','Linewidth',1,'LineStyle','--');
hold off;
set(gca,'FontWeight','bold');
title('REV1--phase','FontWeight','bold','FontSize',14);
subplot(4,1,3);
plot(Rev2_first_abs,'k');
hold on;
plot(Rev2_abs_keypair(:,1),Rev2_first_abs(Rev2_abs_keypair(:,1)),'ro');
line_range = [min(Rev2_first_abs) max(Rev2_first_abs)];
line([Rev2_abs_keypair(:,1),Rev2_abs_keypair(:,1)],line_range,'Color','r','Linewidth',1,'LineStyle','--');
plot(Rev2_abs_keypair(:,2),Rev2_first_abs(Rev2_abs_keypair(:,2)),'bo');
line([Rev2_abs_keypair(:,2),Rev2_abs_keypair(:,2)],line_range,'Color','b','Linewidth',1,'LineStyle','--');
hold off;
set(gca,'FontWeight','bold');
title('REV2--abs','FontWeight','bold','FontSize',14);
subplot(4,1,4);
plot(Rev2_first_phase,'k');
hold on;
plot(Rev2_phase_keypair(:,1),Rev2_first_phase(Rev2_phase_keypair(:,1)),'ro');
line_range = [min(Rev2_first_phase) max(Rev2_first_phase)];
line([Rev2_phase_keypair(:,1),Rev2_phase_keypair(:,1)],line_range,'Color','r','Linewidth',1,'LineStyle','--');
plot(Rev2_phase_keypair(:,2),Rev2_first_phase(Rev2_phase_keypair(:,2)),'bo');
line([Rev2_phase_keypair(:,2),Rev2_phase_keypair(:,2)],line_range,'Color','b','Linewidth',1,'LineStyle','--');
hold off;
set(gca,'FontWeight','bold');
title('REV2--phase','FontWeight','bold','FontSize',14);

sgtitle('每一维数据单独分割结果','Color',[0.00, 0.45, 0.74]);
sgt.FontSize = 20;

