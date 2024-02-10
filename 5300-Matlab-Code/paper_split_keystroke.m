%% 论文相幅联合优化算法展示

clc;
clear;
csi_trace1 = read_bf_file('./data0704/0704Z/loc6_p123789.dat'); % 数据文件路径
csi_trace2 = read_bf_file('./data0704/0704W/loc6_p123789.dat');

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

%% 得到比率数据
REV1_ratio_r1r2 = REV1_t1_r1./REV1_t1_r2;


REV2_ratio_r1r2 = REV2_t1_r1./REV2_t1_r2;


%比率振幅数据
REV1_abs_ratio_r1r2 = abs(REV1_ratio_r1r2);

REV2_abs_ratio_r1r2 = abs(REV2_ratio_r1r2);


%比率相位数据
REV1_phase_ratio_r1r2 = angle(REV1_ratio_r1r2);

REV2_phase_ratio_r1r2 = angle(REV2_ratio_r1r2);

%去除振幅和相位异常值
REV1_abs_ratio_r1r2 = Use_hampel(REV1_abs_ratio_r1r2);

REV2_abs_ratio_r1r2 = Use_hampel(REV2_abs_ratio_r1r2);


REV1_phase_ratio_r1r2 = Use_hampel(REV1_phase_ratio_r1r2);

REV2_phase_ratio_r1r2 = Use_hampel(REV2_phase_ratio_r1r2);

%对振幅和相位进行Savitzky-Golay滤波
REV1_abs_ratio_r1r2 = func_sg(REV1_abs_ratio_r1r2);


REV2_abs_ratio_r1r2 = func_sg(REV2_abs_ratio_r1r2);

REV1_phase_ratio_r1r2 = func_sg(REV1_phase_ratio_r1r2);

REV2_phase_ratio_r1r2 = func_sg(REV2_phase_ratio_r1r2);

%归一化处理
REV1_abs_ratio_r1r2 = fun_allNormalized_1(REV1_abs_ratio_r1r2);

REV1_phase_ratio_r1r2 = fun_allNormalized_1(REV1_phase_ratio_r1r2);

REV2_abs_ratio_r1r2 = fun_allNormalized_1(REV2_abs_ratio_r1r2);

REV2_phase_ratio_r1r2 = fun_allNormalized_1(REV2_phase_ratio_r1r2);

[COEFF1 ,SCORE1,latent1] = pca(REV1_abs_ratio_r1r2.');
explained1 = 100*latent1/sum(latent1);%计算贡献率
REV1_first_abs_csi = SCORE1(:,1);

[COEFF2,SCORE2,latent2] = pca(REV1_phase_ratio_r1r2.');
explained2 = 100*latent2/sum(latent2);%计算贡献率
REV1_first_phase_csi = SCORE2(:,1);

[COEFF3 ,SCORE3,latent3] = pca(REV2_abs_ratio_r1r2.');
explained3 = 100*latent3/sum(latent3);%计算贡献率
REV2_first_abs_csi = SCORE3(:,1);

[COEFF4,SCORE4,latent4] = pca(REV2_phase_ratio_r1r2.');
explained4 = 100*latent4/sum(latent4);%计算贡献率
REV2_first_phase_csi = SCORE4(:,1);

figure;
subplot(2,1,1);
hold on;
plot(REV1_first_abs_csi,'r');
plot(REV2_first_abs_csi,'b');
legend("Line1","Line2");
hold off;
set(gca,'FontWeight','bold');
title('预处理后——振幅第一主成分','FontWeight','bold','FontSize',14);
xlabel('CSI Packet index');
ylabel('Value');

subplot(2,1,2);
hold on;
plot(REV1_first_phase_csi,'r');
plot(REV2_first_phase_csi,'b');
legend("Line1","Line2");
hold off;
set(gca,'FontWeight','bold');
title('预处理后——相位第一主成分','FontWeight','bold','FontSize',14);
xlabel('CSI Packet index');
ylabel('Value');



%% %%%%%%
Rev1_abs_keypair = fun_split_keystroke3(REV1_first_abs_csi,0.0013);
Rev1_phase_keypair = fun_split_keystroke3(REV1_first_phase_csi,0.0013);
Rev2_abs_keypair = fun_split_keystroke3(REV2_first_abs_csi,0.0009);
Rev2_phase_keypair = fun_split_keystroke3(REV2_first_phase_csi,0.0013);

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
plot(REV1_first_abs_csi,'k');
hold on;
plot(Rev1_abs_keypair(:,1),REV1_first_abs_csi(Rev1_abs_keypair(:,1)),'ro');
line_range = [min(REV1_first_abs_csi) max(REV1_first_abs_csi)];
line([Rev1_abs_keypair(:,1),Rev1_abs_keypair(:,1)],line_range,'Color','r','Linewidth',1,'LineStyle','--');
plot(Rev1_abs_keypair(:,2),REV1_first_abs_csi(Rev1_abs_keypair(:,2)),'bo');
line([Rev1_abs_keypair(:,2),Rev1_abs_keypair(:,2)],line_range,'Color','b','Linewidth',1,'LineStyle','--');
hold off;
set(gca,'FontWeight','bold');
title('REV1--abs','FontWeight','bold','FontSize',14);
subplot(4,1,2);
plot(REV1_first_phase_csi,'k');
hold on;
plot(Rev1_phase_keypair(:,1),REV1_first_phase_csi(Rev1_phase_keypair(:,1)),'ro');
line_range = [min(REV1_first_phase_csi) max(REV1_first_phase_csi)];
line([Rev1_phase_keypair(:,1),Rev1_phase_keypair(:,1)],line_range,'Color','r','Linewidth',1,'LineStyle','--');
plot(Rev1_phase_keypair(:,2),REV1_first_phase_csi(Rev1_phase_keypair(:,2)),'bo');
line([Rev1_phase_keypair(:,2),Rev1_phase_keypair(:,2)],line_range,'Color','b','Linewidth',1,'LineStyle','--');
hold off;
set(gca,'FontWeight','bold');
title('REV1--phase','FontWeight','bold','FontSize',14);
subplot(4,1,3);
plot(REV2_first_abs_csi,'k');
hold on;
plot(Rev2_abs_keypair(:,1),REV2_first_abs_csi(Rev2_abs_keypair(:,1)),'ro');
line_range = [min(REV2_first_abs_csi) max(REV2_first_abs_csi)];
line([Rev2_abs_keypair(:,1),Rev2_abs_keypair(:,1)],line_range,'Color','r','Linewidth',1,'LineStyle','--');
plot(Rev2_abs_keypair(:,2),REV2_first_abs_csi(Rev2_abs_keypair(:,2)),'bo');
line([Rev2_abs_keypair(:,2),Rev2_abs_keypair(:,2)],line_range,'Color','b','Linewidth',1,'LineStyle','--');
hold off;
set(gca,'FontWeight','bold');
title('REV2--abs','FontWeight','bold','FontSize',14);
subplot(4,1,4);
plot(REV2_first_phase_csi,'k');
hold on;
plot(Rev2_phase_keypair(:,1),REV2_first_phase_csi(Rev2_phase_keypair(:,1)),'ro');
line_range = [min(REV2_first_phase_csi) max(REV2_first_phase_csi)];
line([Rev2_phase_keypair(:,1),Rev2_phase_keypair(:,1)],line_range,'Color','r','Linewidth',1,'LineStyle','--');
plot(Rev2_phase_keypair(:,2),REV2_first_phase_csi(Rev2_phase_keypair(:,2)),'bo');
line([Rev2_phase_keypair(:,2),Rev2_phase_keypair(:,2)],line_range,'Color','b','Linewidth',1,'LineStyle','--');
hold off;
set(gca,'FontWeight','bold');
title('REV2--phase','FontWeight','bold','FontSize',14);

sgtitle('每一维数据单独分割结果','Color',[0.00, 0.45, 0.74]);
sgt.FontSize = 20;



%% 相幅联合优化分割算法
copy_Rev1_abs_keypair = Rev1_abs_keypair;
copy_Rev1_phase_keypair = Rev1_phase_keypair;

copy_Rev2_abs_keypair = Rev2_abs_keypair;
copy_Rev2_phase_keypair = Rev2_phase_keypair;


%% 对得到的4组索引值进行合并
merge_keypair = [];
while ~(isempty(Rev1_abs_keypair)&&isempty(Rev1_phase_keypair)&&isempty(Rev2_abs_keypair)&&isempty(Rev2_phase_keypair))
    right_possible = [];
    if ~isempty(Rev1_abs_keypair)
        right_possible = [right_possible Rev1_abs_keypair(1,2)];
    else
        right_possible = [right_possible 99999];
    end
    if ~isempty(Rev1_phase_keypair)
        right_possible = [right_possible Rev1_phase_keypair(1,2)];
    else
        right_possible = [right_possible 99999];
    end
    if ~isempty(Rev2_abs_keypair)
        right_possible = [right_possible Rev2_abs_keypair(1,2)];
    else
        right_possible = [right_possible 0];
    end
    if ~isempty(Rev2_phase_keypair)
        right_possible = [right_possible Rev2_phase_keypair(1,2)];
    else
        right_possible = [right_possible 0];
    end
    
    [right_value,minIndex] = min(right_possible);
    if minIndex==1
        left_value = Rev1_abs_keypair(1,1);
        Rev1_abs_keypair(1,:) = [];
    elseif minIndex==2
        left_value = Rev1_phase_keypair(1,1);
        Rev1_phase_keypair(1,:) = [];
    elseif minIndex==3
        left_value = Rev2_abs_keypair(1,1);
        Rev2_abs_keypair(1,:) = [];
    else
        left_value = Rev2_phase_keypair(1,1);
        Rev2_phase_keypair(1,:) = [];
    end
    
    while((~isempty(Rev1_abs_keypair)&&left_value<Rev1_abs_keypair(1,1)&&right_value>Rev1_abs_keypair(1,1)&&right_value<Rev1_abs_keypair(1,2))...
        ||(~isempty(Rev1_phase_keypair)&&left_value<Rev1_phase_keypair(1,1)&&right_value>Rev1_phase_keypair(1,1)&&right_value<Rev1_phase_keypair(1,2))...
        ||(~isempty(Rev2_abs_keypair)&&left_value<Rev2_abs_keypair(1,1)&&right_value>Rev2_abs_keypair(1,1)&&right_value<Rev2_abs_keypair(1,2))...
    ||(~isempty(Rev2_phase_keypair)&&left_value<Rev2_phase_keypair(1,1)&&right_value>Rev2_phase_keypair(1,1)&&right_value<Rev2_phase_keypair(1,2)))
    
        if(~isempty(Rev1_abs_keypair)&&left_value<Rev1_abs_keypair(1,1)&&right_value>Rev1_abs_keypair(1,1)&&right_value<Rev1_abs_keypair(1,2))
            left_value = Rev1_abs_keypair(1,1);
            Rev1_abs_keypair(1,:) = [];
        end
        if(~isempty(Rev1_phase_keypair)&&left_value<Rev1_phase_keypair(1,1)&&right_value>Rev1_phase_keypair(1,1)&&right_value<Rev1_phase_keypair(1,2))
            left_value = Rev1_phase_keypair(1,1);
            Rev1_phase_keypair(1,:) = [];
        end
        if(~isempty(Rev2_abs_keypair)&&left_value<Rev2_abs_keypair(1,1)&&right_value>Rev2_abs_keypair(1,1)&&right_value<Rev2_abs_keypair(1,2))
            left_value = Rev2_abs_keypair(1,1);
            Rev2_abs_keypair(1,:) = [];
        end
        if(~isempty(Rev2_phase_keypair)&&left_value<Rev2_phase_keypair(1,1)&&right_value>Rev2_phase_keypair(1,1)&&right_value<Rev2_phase_keypair(1,2))
            left_value = Rev2_phase_keypair(1,1);
            Rev2_phase_keypair(1,:) = [];
        end
    end
    
    while ~isempty(Rev1_abs_keypair)
       if( Rev1_abs_keypair(1,1)<right_value && Rev1_abs_keypair(1,2)>right_value)
           Rev1_abs_keypair(1,:) = [];
       else
           break;
       end
    end
    
    while ~isempty(Rev1_phase_keypair)
       if( Rev1_phase_keypair(1,1)<right_value && Rev1_phase_keypair(1,2)>right_value)
           Rev1_phase_keypair(1,:) = [];
       else
           break;
       end
    end
    
    while ~isempty(Rev2_abs_keypair)
       if( Rev2_abs_keypair(1,1)<right_value && Rev2_abs_keypair(1,2)>right_value)
           Rev2_abs_keypair(1,:) = [];
       else
           break;
       end
    end
    
    while ~isempty(Rev2_phase_keypair)
       if( Rev2_phase_keypair(1,1)<right_value && Rev2_phase_keypair(1,2)>right_value)
           Rev2_phase_keypair(1,:) = [];
       else
           break;
       end
    end
    
    keystroke_index = [left_value right_value];
    merge_keypair = [merge_keypair;keystroke_index];
end

Rev1_abs_keypair = copy_Rev1_abs_keypair;
Rev1_phase_keypair = copy_Rev1_phase_keypair;

Rev2_abs_keypair = copy_Rev2_abs_keypair;
Rev2_phase_keypair = copy_Rev2_phase_keypair;

%% 画出4个一维数组按键分割的结果
figure;
for i = 1:length(Rev1_abs_keypair)
   p1 = line(Rev1_abs_keypair(i,:),[1,1],'Color',[0.6350 0.0780 0.1840],'LineWidth',2);
   hold on;
   line([Rev1_abs_keypair(i,1),Rev1_abs_keypair(i,1)],[0,1],'Color',[0.6350 0.0780 0.1840],'LineWidth',1,'LineStyle',':');
   line([Rev1_abs_keypair(i,2),Rev1_abs_keypair(i,2)],[0,1],'Color',[0.6350 0.0780 0.1840],'LineWidth',1,'LineStyle',':');
end
for i = 1:length(Rev1_phase_keypair)
   p2 = line(Rev1_phase_keypair(i,:),[2,2],'Color',[0 0.4470 0.7410],'LineWidth',2);
   line([Rev1_phase_keypair(i,1),Rev1_phase_keypair(i,1)],[0,2],'Color',[0 0.4470 0.7410],'LineWidth',1,'LineStyle',':');
   line([Rev1_phase_keypair(i,2),Rev1_phase_keypair(i,2)],[0,2],'Color',[0 0.4470 0.7410],'LineWidth',1,'LineStyle',':');
end
for i = 1:length(Rev2_abs_keypair)
   p3 = line(Rev2_abs_keypair(i,:),[3,3],'Color',[0.4660 0.6740 0.1880],'LineWidth',2);
   line([Rev2_abs_keypair(i,1),Rev2_abs_keypair(i,1)],[0,3],'Color',[0.4660 0.6740 0.1880],'LineWidth',1,'LineStyle',':');
   line([Rev2_abs_keypair(i,2),Rev2_abs_keypair(i,2)],[0,3],'Color',[0.4660 0.6740 0.1880],'LineWidth',1,'LineStyle',':');
end
for i = 1:length(Rev2_phase_keypair)
   p4 = line(Rev2_phase_keypair(i,:),[4,4],'Color',[0.9290 0.6940 0.1250],'LineWidth',2);
   line([Rev2_phase_keypair(i,1),Rev2_phase_keypair(i,1)],[0,4],'Color',[0.9290 0.6940 0.1250],'LineWidth',1,'LineStyle',':');
   line([Rev2_phase_keypair(i,2),Rev2_phase_keypair(i,2)],[0,4],'Color',[0.9290 0.6940 0.1250],'LineWidth',1,'LineStyle',':');
end

for i = 1:length(merge_keypair)
   p5 = line(merge_keypair(i,:),[5,5],'Color','k','LineWidth',2);
   line([merge_keypair(i,1),merge_keypair(i,1)],[0,5],'Color','k','LineWidth',2,'LineStyle',':');
   line([merge_keypair(i,2),merge_keypair(i,2)],[0,5],'Color','k','LineWidth',2,'LineStyle',':');
end
legend([p1,p2,p3,p4,p5],'Receiver1 Amplitude Split Results','Receiver1 Phase Split Results','Receiver2 Amplitude Split Results','Receiver2 Phase Split Results','Joint Adjustment Results');
hold off;
set(gca,'FontWeight','bold');
title('Phase-Amplitude Joint Optimization Adjustment','FontWeight','bold','FontSize',14);


figure;
subplot(4,1,1);
plot(REV1_first_abs_csi,'k');
hold on;
plot(merge_keypair(:,1),REV1_first_abs_csi(merge_keypair(:,1)),'ro');
line_range = [min(REV1_first_abs_csi) max(REV1_first_abs_csi)];
line([merge_keypair(:,1),merge_keypair(:,1)],line_range,'Color','r','Linewidth',1,'LineStyle','--');
plot(merge_keypair(:,2),REV1_first_abs_csi(merge_keypair(:,2)),'bo');
line([merge_keypair(:,2),merge_keypair(:,2)],line_range,'Color','b','Linewidth',1,'LineStyle','--');
hold off;
set(gca,'FontWeight','bold');
title('REV1--abs','FontWeight','bold','FontSize',14);
subplot(4,1,2);
plot(REV1_first_phase_csi,'k');
hold on;
plot(merge_keypair(:,1),REV1_first_phase_csi(merge_keypair(:,1)),'ro');
line_range = [min(REV1_first_phase_csi) max(REV1_first_phase_csi)];
line([merge_keypair(:,1),merge_keypair(:,1)],line_range,'Color','r','Linewidth',1,'LineStyle','--');
plot(merge_keypair(:,2),REV1_first_phase_csi(merge_keypair(:,2)),'bo');
line([merge_keypair(:,2),merge_keypair(:,2)],line_range,'Color','b','Linewidth',1,'LineStyle','--');
hold off;
set(gca,'FontWeight','bold');
title('REV1--phase','FontWeight','bold','FontSize',14);
subplot(4,1,3);
plot(REV2_first_abs_csi,'k');
hold on;
plot(merge_keypair(:,1),REV2_first_abs_csi(merge_keypair(:,1)),'ro');
line_range = [min(REV2_first_abs_csi) max(REV2_first_abs_csi)];
line([merge_keypair(:,1),merge_keypair(:,1)],line_range,'Color','r','Linewidth',1,'LineStyle','--');
plot(merge_keypair(:,2),REV2_first_abs_csi(merge_keypair(:,2)),'bo');
line([merge_keypair(:,2),merge_keypair(:,2)],line_range,'Color','b','Linewidth',1,'LineStyle','--');
hold off;
set(gca,'FontWeight','bold');
title('REV2--abs','FontWeight','bold','FontSize',14);
subplot(4,1,4);
plot(REV2_first_phase_csi,'k');
hold on;
plot(merge_keypair(:,1),REV2_first_phase_csi(merge_keypair(:,1)),'ro');
line_range = [min(REV2_first_phase_csi) max(REV2_first_phase_csi)];
line([merge_keypair(:,1),merge_keypair(:,1)],line_range,'Color','r','Linewidth',1,'LineStyle','--');
plot(merge_keypair(:,2),REV2_first_phase_csi(merge_keypair(:,2)),'bo');
line([merge_keypair(:,2),merge_keypair(:,2)],line_range,'Color','b','Linewidth',1,'LineStyle','--');
hold off;
set(gca,'FontWeight','bold');
title('REV2--phase','FontWeight','bold','FontSize',14);

sgtitle('联合优化调整后分割结果','Color',[0.00, 0.45, 0.74]);
sgt.FontSize = 20;