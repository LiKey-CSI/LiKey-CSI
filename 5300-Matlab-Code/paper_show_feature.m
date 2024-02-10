clc;
clear;

figure;
colormap(gray);
subplot(2,1,1);
imagesc(Rev2_number4_1);
set(gca,'FontWeight','bold');
xlabel('Num');
ylabel('Subcarrier');
title('Receiver1 Feature','FontWeight','bold','FontSize',14);
subplot(2,1,2);
imagesc(Rev1_number4_1);
set(gca,'FontWeight','bold');
xlabel('Num');
ylabel('Subcarrier');
title('Receiver2 Feature','FontWeight','bold','FontSize',14);


choose_num = 1;
number_Rev2 = squeeze(loc1_Rev2_feature_mat(choose_num,:,:));

number_Rev1 = squeeze(loc1_Rev1_feature_mat(choose_num,:,:));
figure;
subplot(2,1,1);
plot(number_Rev2(16,:));
xlabel('Feature Index');
ylabel('Value');
title('Receiver1 Feature','FontWeight','bold','FontSize',14);

subplot(2,1,2);
plot(number_Rev1(16,:));
xlabel('Num');
ylabel('Value');
title('Receiver2 Feature','FontWeight','bold','FontSize',14);

figure;
plot(number_Rev1);


% 生成一个随机的30x60矩阵作为示例数据
data = rand(30, 60);

% 创建网格点坐标
[x, y] = meshgrid(1:60, 1:30);

% 绘制三维图
figure;
mesh(x, y, number_Rev2);
title('3D Surface Plot of a 30x60 Matrix');
xlabel('X');
ylabel('Y');
zlabel('Value');
