%% 仅仅是两个接收机的振幅分割结果进行

Rev1_abs_keypair = fun_split_keystroke(REV1_first_abs_csi);

Rev2_abs_keypair = fun_split_keystroke(REV2_first_abs_csi);


% 拷贝一份4个一维数组的分割结果
copy_Rev1_abs_keypair = Rev1_abs_keypair;

copy_Rev2_abs_keypair = Rev2_abs_keypair;


%% 对得到的4组索引值进行合并
merge_keypair = [];
while ~(isempty(Rev1_abs_keypair)&&isempty(Rev2_abs_keypair))
    left_possible = [];
    if ~isempty(Rev1_abs_keypair)
        left_possible = [left_possible Rev1_abs_keypair(1,1)];
    else
        left_possible = [left_possible 99999];
    end
    if ~isempty(Rev2_abs_keypair)
        left_possible = [left_possible Rev2_abs_keypair(1,1)];
    else
        left_possible = [left_possible 99999];
    end
    
    [left_value,minIndex] = min(left_possible);
    if minIndex==1
        right_value = Rev1_abs_keypair(1,2);
        Rev1_abs_keypair(1,:) = [];
    else
        right_value = Rev2_abs_keypair(1,2);
        Rev2_abs_keypair(1,:) = [];
    end
    
    while((~isempty(Rev1_abs_keypair)&&right_value>Rev1_abs_keypair(1,1)&&right_value<Rev1_abs_keypair(1,2))...
        ||(~isempty(Rev2_abs_keypair)&&right_value>Rev2_abs_keypair(1,1)&&right_value<Rev2_abs_keypair(1,2)))
    
        if(~isempty(Rev1_abs_keypair)&&right_value>Rev1_abs_keypair(1,1)&&right_value<Rev1_abs_keypair(1,2))
            right_value = Rev1_abs_keypair(1,2);
            Rev1_abs_keypair(1,:) = [];
        end
        
        if(~isempty(Rev2_abs_keypair)&&right_value>Rev2_abs_keypair(1,1)&&right_value<Rev2_abs_keypair(1,2))
            right_value = Rev2_abs_keypair(1,2);
            Rev2_abs_keypair(1,:) = [];
        end
       
    end
    
    while ~isempty(Rev1_abs_keypair)
       if( Rev1_abs_keypair(1,2)<right_value)
           Rev1_abs_keypair(1,:) = [];
       else
           break;
       end
    end
    
    
    while ~isempty(Rev2_abs_keypair)
       if( Rev2_abs_keypair(1,2)<right_value)
           Rev2_abs_keypair(1,:) = [];
       else
           break;
       end
    end
    
    keystroke_index = [left_value right_value];
    merge_keypair = [merge_keypair;keystroke_index];
end

%% 对合并后的结果进行调整，若还有交集部分，则合并
i = 1;
while i<length(merge_keypair)
    if(merge_keypair(i+1,1)>merge_keypair(i,1) && merge_keypair(i+1,1)<merge_keypair(i,2))
        merge_keypair(i,2) = merge_keypair(i+1,2);
        merge_keypair(i+1,:) = [];
    else
        i = i+1;
    end
end

union_keypair = merge_keypair;

%% 依情况看是否需要注释：   取范围小的交集部分
Rev1_abs_keypair = copy_Rev1_abs_keypair;

Rev2_abs_keypair = copy_Rev2_abs_keypair;

% 
%对同一个合并范围内的分割结果进行合并
for i = 1:length(merge_keypair)
    judg_key = merge_keypair(i,:);
    j = 1;
    while(j<length(Rev1_abs_keypair))
       if( Rev1_abs_keypair(j,1)>=judg_key(1) && Rev1_abs_keypair(j,2)<=judg_key(2))
           if(Rev1_abs_keypair(j+1,1)>=judg_key(1) && Rev1_abs_keypair(j+1,2)<=judg_key(2))
               Rev1_abs_keypair(j,2) = Rev1_abs_keypair(j+1,2);
               Rev1_abs_keypair(j+1,:) = [];
           else
               j = j + 1;
               break;
           end
       else
           j = j+1;
       end
    end
    
    
    j = 1;
    while(j<length(Rev2_abs_keypair))
       if( Rev2_abs_keypair(j,1)>=judg_key(1) && Rev2_abs_keypair(j,2)<=judg_key(2))
           if(Rev2_abs_keypair(j+1,1)>=judg_key(1) && Rev2_abs_keypair(j+1,2)<=judg_key(2))
               Rev2_abs_keypair(j,2) = Rev2_abs_keypair(j+1,2);
               Rev2_abs_keypair(j+1,:) = [];
           else
               j = j + 1;
               break;
           end
       else
           j = j+1;
       end
    end
    
end

%% 画出4个一维数组按键分割的结果
figure;
for i = 1:length(Rev1_abs_keypair)
   line(Rev1_abs_keypair(i,:),[1,1],'Color',[0.6350 0.0780 0.1840],'LineWidth',2);
   hold on;
   line([Rev1_abs_keypair(i,1),Rev1_abs_keypair(i,1)],[0,1],'Color',[0.6350 0.0780 0.1840],'LineWidth',1,'LineStyle',':');
   line([Rev1_abs_keypair(i,2),Rev1_abs_keypair(i,2)],[0,1],'Color',[0.6350 0.0780 0.1840],'LineWidth',1,'LineStyle',':');
end

for i = 1:length(Rev2_abs_keypair)
   line(Rev2_abs_keypair(i,:),[2,2],'Color',[0.4660 0.6740 0.1880],'LineWidth',2);
   line([Rev2_abs_keypair(i,1),Rev2_abs_keypair(i,1)],[0,2],'Color',[0.4660 0.6740 0.1880],'LineWidth',1,'LineStyle',':');
   line([Rev2_abs_keypair(i,2),Rev2_abs_keypair(i,2)],[0,2],'Color',[0.4660 0.6740 0.1880],'LineWidth',1,'LineStyle',':');
end

for i = 1:length(merge_keypair)
    start_range = merge_keypair(i,1);
    end_range = merge_keypair(i,2);
    if(~isempty(Rev1_abs_keypair)&&Rev1_abs_keypair(1,1)<merge_keypair(i,2))
        if(Rev1_abs_keypair(1,1)>merge_keypair(i,1))
            merge_keypair(i,1) = Rev1_abs_keypair(1,1);
        end
        if(Rev1_abs_keypair(1,2)<merge_keypair(i,2))
            merge_keypair(i,2) = Rev1_abs_keypair(1,2);
        end
    end
    
    if(~isempty(Rev2_abs_keypair)&&Rev2_abs_keypair(1,1)<merge_keypair(i,2))
        if(Rev2_abs_keypair(1,1)>merge_keypair(i,1))
            merge_keypair(i,1) = Rev2_abs_keypair(1,1);
        end
        if(Rev2_abs_keypair(1,2)<merge_keypair(i,2))
            merge_keypair(i,2) = Rev2_abs_keypair(1,2);
        end
    end
    
    
    while(~isempty(Rev1_abs_keypair)&&Rev1_abs_keypair(1,2)<=end_range)
        Rev1_abs_keypair(1,:) = [];
    end
    
    while(~isempty(Rev2_abs_keypair)&&Rev2_abs_keypair(1,2)<=end_range)
        Rev2_abs_keypair(1,:) = [];
    end
    
end

inter_keypair = merge_keypair;

%% 将并集结果和交集结果进行联合判断调整
final_keypair = zeros(length(inter_keypair),2);
for i = 1:length(inter_keypair)
   if(inter_keypair(i,2)-inter_keypair(i,1)<400)
       final_keypair(i,:) = union_keypair(i,:);
   else
       final_keypair(i,:) = inter_keypair(i,:);
   end
end

i = 1;
while i<length(final_keypair)
    if(abs(REV1_first_abs_csi(final_keypair(i+1,1))-REV1_first_abs_csi(final_keypair(i,1)))>2)...
        && (abs(REV2_first_abs_csi(final_keypair(i+1,1))-REV2_first_abs_csi(final_keypair(i,1)))>2)
       final_keypair(i,2) = final_keypair(i+1,2);
       final_keypair(i+1,:) = [];
    end
    i = i + 1;
end

for i = 1:length(final_keypair)
   line(final_keypair(i,:),[5,5],'Color','k','LineWidth',2);
   line([final_keypair(i,1),final_keypair(i,1)],[0,5],'Color','k','LineWidth',2,'LineStyle',':');
   line([final_keypair(i,2),final_keypair(i,2)],[0,5],'Color','k','LineWidth',2,'LineStyle',':');
end
hold off;
set(gca,'FontWeight','bold');
title('二维结果合并算法描述','FontWeight','bold','FontSize',14);

figure;
subplot(2,1,1);
plot(REV1_first_abs_csi,'k');
hold on;
plot(final_keypair(:,1),REV1_first_abs_csi(final_keypair(:,1)),'ro');
line_range = [min(REV1_first_abs_csi) max(REV1_first_abs_csi)];
line([final_keypair(:,1),final_keypair(:,1)],line_range,'Color','r','Linewidth',1,'LineStyle','--');
plot(final_keypair(:,2),REV1_first_abs_csi(final_keypair(:,2)),'bo');
line([final_keypair(:,2),final_keypair(:,2)],line_range,'Color','b','Linewidth',1,'LineStyle','--');
hold off;
set(gca,'FontWeight','bold');
title('REV1--abs','FontWeight','bold','FontSize',14);

subplot(2,1,2);
plot(REV2_first_abs_csi,'k');
hold on;
plot(final_keypair(:,1),REV2_first_abs_csi(final_keypair(:,1)),'ro');
line_range = [min(REV2_first_abs_csi) max(REV2_first_abs_csi)];
line([final_keypair(:,1),final_keypair(:,1)],line_range,'Color','r','Linewidth',1,'LineStyle','--');
plot(final_keypair(:,2),REV2_first_abs_csi(final_keypair(:,2)),'bo');
line([final_keypair(:,2),final_keypair(:,2)],line_range,'Color','b','Linewidth',1,'LineStyle','--');
hold off;
set(gca,'FontWeight','bold');
title('REV2--abs','FontWeight','bold','FontSize',14);


%% 根据分割结果表现各个按键的特征
filter_REV1_ratio_r1r2 = func_sg(REV1_ratio_r1r2);
filter_REV1_ratio_r1r3 = func_sg(REV1_ratio_r1r3);
filter_REV1_ratio_r2r3 = func_sg(REV1_ratio_r2r3);
filter_REV2_ratio_r1r2 = func_sg(REV2_ratio_r1r2);
filter_REV2_ratio_r1r3 = func_sg(REV2_ratio_r1r3);
filter_REV2_ratio_r2r3 = func_sg(REV2_ratio_r2r3);

feature_num = 20;
sub_carrier = 1;
allkey_feature_REV1_r1r2 = zeros(length(final_keypair),feature_num);
allkey_feature_REV1_r1r3 = zeros(length(final_keypair),feature_num);
allkey_feature_REV1_r2r3 = zeros(length(final_keypair),feature_num);
allkey_feature_REV2_r1r2 = zeros(length(final_keypair),feature_num);
allkey_feature_REV2_r1r3 = zeros(length(final_keypair),feature_num);
allkey_feature_REV2_r2r3 = zeros(length(final_keypair),feature_num);

for i = 1:length(final_keypair)
    start_index = final_keypair(i,1);
    end_index = final_keypair(i,2);
    mean_num = floor((end_index-start_index)./(feature_num+1));
    
    mean_REV1_r1r2 = fun_mean_num_complex(filter_REV1_ratio_r1r2(sub_carrier,start_index:end_index),mean_num);
    mean_REV1_r1r3 = fun_mean_num_complex(filter_REV1_ratio_r1r3(sub_carrier,start_index:end_index),mean_num);
    mean_REV1_r2r3 = fun_mean_num_complex(filter_REV1_ratio_r2r3(sub_carrier,start_index:end_index),mean_num);
    
    mean_REV2_r1r2 = fun_mean_num_complex(filter_REV2_ratio_r1r2(sub_carrier,start_index:end_index),mean_num);
    mean_REV2_r1r3 = fun_mean_num_complex(filter_REV2_ratio_r1r3(sub_carrier,start_index:end_index),mean_num);
    mean_REV2_r2r3 = fun_mean_num_complex(filter_REV2_ratio_r2r3(sub_carrier,start_index:end_index),mean_num);
    
    %% 扩展mean的长度以适应之后的特征数
    mean_REV1_r1r2 = interp1(mean_REV1_r1r2,1:feature_num+2);
    mean_REV1_r1r3 = interp1(mean_REV1_r1r3,1:feature_num+2);
    mean_REV1_r2r3 = interp1(mean_REV1_r2r3,1:feature_num+2);
    
    mean_REV2_r1r2 = interp1(mean_REV2_r1r2,1:feature_num+2);
    mean_REV2_r1r3 = interp1(mean_REV2_r1r3,1:feature_num+2);
    mean_REV2_r2r3 = interp1(mean_REV2_r2r3,1:feature_num+2);
    
    feature_REV1_r1r2 = fun_calc_rotefeature(mean_REV1_r1r2);
    feature_REV1_r1r3 = fun_calc_rotefeature(mean_REV1_r1r3);
    feature_REV1_r2r3 = fun_calc_rotefeature(mean_REV1_r2r3);
    
    feature_REV2_r1r2 = fun_calc_rotefeature(mean_REV2_r1r2);
    feature_REV2_r1r3 = fun_calc_rotefeature(mean_REV2_r1r3);
    feature_REV2_r2r3 = fun_calc_rotefeature(mean_REV2_r2r3);
    
    allkey_feature_REV1_r1r2(i,:) = feature_REV1_r1r2;
    allkey_feature_REV1_r1r3(i,:) = feature_REV1_r1r3;
    allkey_feature_REV1_r2r3(i,:) = feature_REV1_r2r3;
    allkey_feature_REV2_r1r2(i,:) = feature_REV2_r1r2;
    allkey_feature_REV2_r1r3(i,:) = feature_REV2_r1r3;
    allkey_feature_REV2_r2r3(i,:) = feature_REV2_r2r3;
end

for i = 1:length(final_keypair)
    figure;
    subplot(2,3,1);
    plot(allkey_feature_REV1_r1r2(i,:),'ro');
    hold on;
    plot(zeros(length(allkey_feature_REV1_r1r2(i,:))),'LineWidth',2);
    hold off;
    set(gca,'FontWeight','bold');
    title('Rev1-R1R2复数运动方向判断','FontWeight','bold','FontSize',14);
    subplot(2,3,2);
    plot(allkey_feature_REV1_r1r3(i,:),'ro');
    hold on;
    plot(zeros(length(allkey_feature_REV1_r1r3(i,:))),'LineWidth',2);
    hold off;
    set(gca,'FontWeight','bold');
    title('Rev1-R1R3复数运动方向判断','FontWeight','bold','FontSize',14);
    subplot(2,3,3);
    plot(allkey_feature_REV1_r2r3(i,:),'ro');
    hold on;
    plot(zeros(length(allkey_feature_REV1_r2r3(i,:))),'LineWidth',2);
    hold off;
    set(gca,'FontWeight','bold');
    title('Rev1-R2R3复数运动方向判断','FontWeight','bold','FontSize',14);
    subplot(2,3,4);
    plot(allkey_feature_REV2_r1r2(i,:),'bo');
    hold on;
    plot(zeros(length(allkey_feature_REV2_r1r2(i,:))),'LineWidth',2);
    hold off;
    set(gca,'FontWeight','bold');
    title('Rev2-R1R2复数运动方向判断','FontWeight','bold','FontSize',14);
    subplot(2,3,5);
    plot(allkey_feature_REV2_r1r3(i,:),'bo');
    hold on;
    plot(zeros(length(allkey_feature_REV2_r1r3(i,:))),'LineWidth',2);
    hold off;
    set(gca,'FontWeight','bold');
    title('Rev2-R1R3复数运动方向判断','FontWeight','bold','FontSize',14);
    subplot(2,3,6);
    plot(allkey_feature_REV2_r2r3(i,:),'bo');
    hold on;
    plot(zeros(length(allkey_feature_REV2_r2r3(i,:))),'LineWidth',2);
    hold off;
    set(gca,'FontWeight','bold');
    title('Rev2-R2R3复数运动方向判断','FontWeight','bold','FontSize',14);
    
    sgt = sgtitle(['第',num2str(i),'次按键'],'Color',[0.00, 0.45, 0.74]);
    sgt.FontSize = 20;
end