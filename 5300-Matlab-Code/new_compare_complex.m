%% 用于观察两个接收端比率之后的复平面图
clc;
clear;

csi_trace1 = read_bf_file('./523_fu/5_23_w/p2_123456789.dat'); % 数据文件路径
csi_trace2 = read_bf_file('./523_fu/5_23_z/p2_123456789.dat');
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
REV1_ratio_r1r3 = REV1_t1_r1./REV1_t1_r3;
REV1_ratio_r2r3 = REV1_t1_r2./REV1_t1_r3;

REV2_ratio_r1r2 = REV2_t1_r1./REV2_t1_r2;
REV2_ratio_r1r3 = REV2_t1_r1./REV2_t1_r3;
REV2_ratio_r2r3 = REV2_t1_r2./REV2_t1_r3;

% text_range = 10630:11540;
% text_show_range = 10630:20:11540;
% text_string = string(text_show_range-min(text_show_range));

% figure;
% subplot(3,1,1);
% plot(REV1_ratio_r1r2(16,text_range),'r.');
% text(real(REV1_ratio_r1r2(16,text_show_range)),imag(REV1_ratio_r1r2(16,text_show_range)),text_string);
% subplot(3,1,2);
% plot(REV1_ratio_r1r3(16,text_range),'b.');
% text(real(REV1_ratio_r1r3(16,text_show_range)),imag(REV1_ratio_r1r3(16,text_show_range)),text_string);
% subplot(3,1,3);
% plot(REV1_ratio_r2r3(16,text_range),'g.');
% text(real(REV1_ratio_r2r3(16,text_show_range)),imag(REV1_ratio_r2r3(16,text_show_range)),text_string);

% figure;
% subplot(3,1,1);
% plot(REV2_ratio_r1r2(16,text_range),'r.');
% text(real(REV2_ratio_r1r2(16,text_show_range)),imag(REV2_ratio_r1r2(16,text_show_range)),text_string);
% subplot(3,1,2);
% plot(REV2_ratio_r1r3(16,text_range),'b.');
% text(real(REV2_ratio_r1r3(16,text_show_range)),imag(REV2_ratio_r1r3(16,text_show_range)),text_string);
% subplot(3,1,3);
% plot(REV2_ratio_r2r3(16,text_range),'g.');
% text(real(REV2_ratio_r2r3(16,text_show_range)),imag(REV2_ratio_r2r3(16,text_show_range)),text_string);

filter_REV1_ratio_r1r2 = func_sg(REV1_ratio_r1r2);
filter_REV1_ratio_r1r3 = func_sg(REV1_ratio_r1r3);
filter_REV1_ratio_r2r3 = func_sg(REV1_ratio_r2r3);
filter_REV2_ratio_r1r2 = func_sg(REV2_ratio_r1r2);
filter_REV2_ratio_r1r3 = func_sg(REV2_ratio_r1r3);
filter_REV2_ratio_r2r3 = func_sg(REV2_ratio_r2r3);

show_range = 13150:13630;
fig1_flag = 1;
fig2_flag = 1;
figure;
for n=show_range
    subplot(2,1,1);
    hold on;
    plot(filter_REV1_ratio_r1r2(16,n),'r.');
    hold off;
    if fig1_flag
        fig1_flag = 0;
        set(gca,'FontWeight','bold');
        title('Rev-W复数运动','FontWeight','bold','FontSize',14);
        xlabel('Real');
        ylabel('Imag');
    end
    subplot(2,1,2);
    hold on;
    plot(filter_REV2_ratio_r1r2(16,n),'b.');
    hold off;
    if fig2_flag
        fig2_flag = 0;
        set(gca,'FontWeight','bold');
        title('Rev-Z复数运动','FontWeight','bold','FontSize',14);
        xlabel('Real');
        ylabel('Imag');
    end
    pause(0.001)
end



% 每50个点取一个平均
mean_50_Rev1 = mean_50_complex(filter_REV1_ratio_r1r2(16,show_range));
mean_50_Rev2 = mean_50_complex(filter_REV2_ratio_r1r2(16,show_range));

Rev1_judge_value = [];
Rev2_judge_value = [];

for i = 2:length(mean_50_Rev1)-1
   first_value_real = real(mean_50_Rev1(i-1));
   first_value_imag = imag(mean_50_Rev1(i-1));
   middle_value_real = real(mean_50_Rev1(i));
   middle_value_imag = imag(mean_50_Rev1(i));
   next_value_real = real(mean_50_Rev1(i+1));
   next_value_imag = imag(mean_50_Rev1(i+1));
   Rev1_judge_value(i-1) = (middle_value_real-first_value_real)*(next_value_imag-middle_value_imag)-(middle_value_imag-first_value_imag)*(next_value_real-middle_value_real);
end

for i = 2:length(mean_50_Rev2)-1
   first_value_real = real(mean_50_Rev2(i-1));
   first_value_imag = imag(mean_50_Rev2(i-1));
   middle_value_real = real(mean_50_Rev2(i));
   middle_value_imag = imag(mean_50_Rev2(i));
   next_value_real = real(mean_50_Rev2(i+1));
   next_value_imag = imag(mean_50_Rev2(i+1));
   Rev2_judge_value(i-1) = (middle_value_real-first_value_real)*(next_value_imag-middle_value_imag)-(middle_value_imag-first_value_imag)*(next_value_real-middle_value_real);
end

for i=1:length(Rev1_judge_value)
    if(Rev1_judge_value(i)>0)
        Rev1_judge_value(i) = 1;
    else
        Rev1_judge_value(i) = -1;
    end
end

for i=1:length(Rev2_judge_value)
    if(Rev2_judge_value(i)>0)
        Rev2_judge_value(i) = 1;
    else
        Rev2_judge_value(i) = -1;
    end
end

    figure;
    subplot(2,1,1);
    plot(Rev1_judge_value,'ro');
    hold on;
    plot(zeros(length(Rev1_judge_value)),'linewidth',2);
    hold off;
    set(gca,'FontWeight','bold');
    title('Rev-W复数运动方向判断','FontWeight','bold','FontSize',14);
    subplot(2,1,2);
    plot(Rev2_judge_value,'bo');
    hold on;
    plot(zeros(length(Rev2_judge_value)),'linewidth',2);
    hold off;
    set(gca,'FontWeight','bold');
    title('Rev-Z复数运动方向判断','FontWeight','bold','FontSize',14);


diff_Rev1_ratio_r1r2 = diff(filter_REV1_ratio_r1r2(16,show_range));
diff_Rev2_ratio_r1r2 = diff(filter_REV2_ratio_r1r2(16,show_range));
figure;
subplot(2,1,1);
plot(angle(diff_Rev1_ratio_r1r2),'ro');
hold on;
plot(zeros(length(diff_Rev1_ratio_r1r2)),'linewidth',2);
hold off;
subplot(2,1,2);
plot(angle(diff_Rev2_ratio_r1r2),'bo');
hold on;
plot(zeros(length(diff_Rev2_ratio_r1r2)),'linewidth',2);
hold off;

figure;
for n=3000:4500
    subplot(2,1,1);
    hold on;
    plot(n-2999,angle(diff_Rev1_ratio_r1r2(16,n)),'ro');
    hold off;
    subplot(2,1,2);
    hold on;
    plot(n-2999,angle(diff_Rev2_ratio_r1r2(16,n)),'bo');
    hold off;
    pause(0.01)
end

figure;
subplot(3,1,1);
plot(filter_REV1_ratio_r1r2(16,text_range),'r.');
text(real(filter_REV1_ratio_r1r2(16,text_show_range)),imag(filter_REV1_ratio_r1r2(16,text_show_range)),text_string);
subplot(3,1,2);
plot(filter_REV1_ratio_r1r3(16,text_range),'b.');
text(real(filter_REV1_ratio_r1r3(16,text_show_range)),imag(filter_REV1_ratio_r1r3(16,text_show_range)),text_string);
subplot(3,1,3);
plot(filter_REV1_ratio_r2r3(16,text_range),'g.');
text(real(filter_REV1_ratio_r2r3(16,text_show_range)),imag(filter_REV1_ratio_r2r3(16,text_show_range)),text_string);

figure;
subplot(3,1,1);
plot(filter_REV2_ratio_r1r2(16,text_range),'r.');
text(real(filter_REV2_ratio_r1r2(16,text_show_range)),imag(filter_REV2_ratio_r1r2(16,text_show_range)),text_string);
subplot(3,1,2);
plot(filter_REV2_ratio_r1r3(16,text_range),'b.');
text(real(filter_REV2_ratio_r1r3(16,text_show_range)),imag(filter_REV2_ratio_r1r3(16,text_show_range)),text_string);
subplot(3,1,3);
plot(filter_REV2_ratio_r2r3(16,text_range),'g.');
text(real(filter_REV2_ratio_r2r3(16,text_show_range)),imag(filter_REV2_ratio_r2r3(16,text_show_range)),text_string);


