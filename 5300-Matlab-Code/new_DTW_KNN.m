clc;
clear;

path = './0802按键特征/旋转特征/location_sum/loc1/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%通过字符串拼接获得的就是绝对路径了
    load(filename{i});
end

loc1_feature = zeros(108,120);
for i = 1:108
    tmp1 = squeeze(loc1_Rev1_feature_mat(i,:,:));
    tmp2 = squeeze(loc1_Rev2_feature_mat(i,:,:));
    tmp = [tmp1(16,:),tmp2(16,:)];
    loc1_feature(i,:) = tmp;
end

path = './0802按键特征/旋转特征/location_sum/loc2/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%通过字符串拼接获得的就是绝对路径了
    load(filename{i});
end

loc2_feature = zeros(108,120);
for i = 1:108
    tmp1 = squeeze(loc2_Rev1_feature_mat(i,:,:));
    tmp2 = squeeze(loc2_Rev2_feature_mat(i,:,:));
    tmp = [tmp1(16,:),tmp2(16,:)];
    loc2_feature(i,:) = tmp;
end

path = './0802按键特征/旋转特征/location_sum/loc3/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%通过字符串拼接获得的就是绝对路径了
    load(filename{i});
end

loc3_feature = zeros(108,120);
for i = 1:108
    tmp1 = squeeze(loc3_Rev1_feature_mat(i,:,:));
    tmp2 = squeeze(loc3_Rev2_feature_mat(i,:,:));
    tmp = [tmp1(16,:),tmp2(16,:)];
    loc3_feature(i,:) = tmp;
end

path = './0802按键特征/旋转特征/location_sum/loc4/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%通过字符串拼接获得的就是绝对路径了
    load(filename{i});
end

loc4_feature = zeros(108,120);
for i = 1:108
    tmp1 = squeeze(loc4_Rev1_feature_mat(i,:,:));
    tmp2 = squeeze(loc4_Rev2_feature_mat(i,:,:));
    tmp = [tmp1(16,:),tmp2(16,:)];
    loc4_feature(i,:) = tmp;
end

path = './0802按键特征/旋转特征/location_sum/loc5/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%通过字符串拼接获得的就是绝对路径了
    load(filename{i});
end

loc5_feature = zeros(108,120);
for i = 1:108
    tmp1 = squeeze(loc5_Rev1_feature_mat(i,:,:));
    tmp2 = squeeze(loc5_Rev2_feature_mat(i,:,:));
    tmp = [tmp1(16,:),tmp2(16,:)];
    loc5_feature(i,:) = tmp;
end

path = './0802按键特征/旋转特征/location_sum/loc6/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%通过字符串拼接获得的就是绝对路径了
    load(filename{i});
end

loc6_feature = zeros(108,120);
for i = 1:108
    tmp1 = squeeze(loc6_Rev1_feature_mat(i,:,:));
    tmp2 = squeeze(loc6_Rev2_feature_mat(i,:,:));
    tmp = [tmp1(16,:),tmp2(16,:)];
    loc6_feature(i,:) = tmp;
end

path = './0802按键特征/旋转特征/location_sum/loc7/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%通过字符串拼接获得的就是绝对路径了
    load(filename{i});
end

loc7_feature = zeros(108,120);
for i = 1:108
    tmp1 = squeeze(loc7_Rev1_feature_mat(i,:,:));
    tmp2 = squeeze(loc7_Rev2_feature_mat(i,:,:));
    tmp = [tmp1(16,:),tmp2(16,:)];
    loc7_feature(i,:) = tmp;
end

path = './0802按键特征/旋转特征/location_sum/loc8/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%通过字符串拼接获得的就是绝对路径了
    load(filename{i});
end

loc8_feature = zeros(108,120);
for i = 1:108
    tmp1 = squeeze(loc8_Rev1_feature_mat(i,:,:));
    tmp2 = squeeze(loc8_Rev2_feature_mat(i,:,:));
    tmp = [tmp1(16,:),tmp2(16,:)];
    loc8_feature(i,:) = tmp;
end

path = './0802按键特征/旋转特征/location_sum/loc9/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%通过字符串拼接获得的就是绝对路径了
    load(filename{i});
end

loc9_feature = zeros(108,120);
for i = 1:108
    tmp1 = squeeze(loc9_Rev1_feature_mat(i,:,:));
    tmp2 = squeeze(loc9_Rev2_feature_mat(i,:,:));
    tmp = [tmp1(16,:),tmp2(16,:)];
    loc9_feature(i,:) = tmp;
end

loc1_feature(find(isnan(loc1_feature)==1)) = 0;
loc2_feature(find(isnan(loc2_feature)==1)) = 0;
loc3_feature(find(isnan(loc3_feature)==1)) = 0;
loc4_feature(find(isnan(loc4_feature)==1)) = 0;
loc5_feature(find(isnan(loc5_feature)==1)) = 0;
loc6_feature(find(isnan(loc6_feature)==1)) = 0;
loc7_feature(find(isnan(loc7_feature)==1)) = 0;
loc8_feature(find(isnan(loc8_feature)==1)) = 0;
loc9_feature(find(isnan(loc9_feature)==1)) = 0;

%% 构造训练集和测试集
traindata = [loc6_feature;loc1_feature;loc7_feature;loc9_feature;loc2_feature;];
testdata = [loc8_feature;loc5_feature;loc3_feature;loc4_feature];
trainlabel = [label_mat;label_mat;label_mat;label_mat;label_mat;];
trainlabel = trainlabel+1;
testlabel = [label_mat;label_mat;label_mat;label_mat];
testlabel = testlabel + 1;

%% 基于DTW的KNN分类
K=6;%参数，设置邻近样本数
sum = 0;
prediction = [];
for times = 1:length(testdata)
    tmp_testdata = testdata(times,:);
    [N,M] = size(traindata);
    %计算训练数据集和测试数据之间的DWT距离
    dist = zeros(N,1);
    for i=1:N
        dist(i,:) = MyDTW(traindata(i,:),tmp_testdata);
    end

    %将dist从小到大进行排序
    [Y,I]=sort(dist,1);   
    %将训练数据对应的类别与训练数据排序结果对应
    tmp_trainlabel=trainlabel(I);
    %确定前K个点所在类别的出现频率
    classNum=length(unique(tmp_trainlabel));%取集合中的单值元素的个数
    labels=zeros(1,classNum);
    for t=1:K
        j=tmp_trainlabel(t);
        labels(j)=labels(j)+1;
    end

    %返回前K个点中出现频率最高的类别作为测试数据的预测分类
    [~,idx]=max(labels);
%     fprintf('该测试数据属于类 %d\n',idx);
    prediction = [prediction;idx];
    if idx == testlabel(times)
        sum = sum + 1;
    end
end

%% 展示最终KNN的分类结果
acc = sum/length(testlabel)*100;
figure;
plot(1:length(testlabel),testlabel.','r-*')
hold on
plot(1:length(testlabel),prediction.','b:o')
grid on
legend('真实类别','预测类别')
xlabel('测试集样本编号')
ylabel('测试集样本类别')
string = {'测试集KNN预测结果';
          ['准确度 = ' num2str(acc) '%']};
title(string)
