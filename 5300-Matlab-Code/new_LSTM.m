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
traindata = [loc6_feature;loc1_feature;loc7_feature;loc9_feature;loc2_feature;loc8_feature;];
testdata = [loc5_feature;loc3_feature;loc4_feature];
trainlabel = [label_mat;label_mat;label_mat;label_mat;label_mat;label_mat;];
trainlabel = trainlabel+1;
testlabel = [label_mat;label_mat;label_mat];
testlabel = testlabel + 1;

XTrain = tonndata(traindata',true,false)';
XTest = tonndata(testdata',true,false)';
YTrain = categorical(trainlabel);
YTest = categorical(testlabel);

%% 构建LSTM网络
inputSize = 120;%特征的维度
numHiddenUnits = 100;%LSTM网路包含的隐藏单元数目
numClasses = 9;%label标签的种数,该例子中为人数

layers = [ ...
    sequenceInputLayer(inputSize)
    lstmLayer(numHiddenUnits,'OutputMode','last')
    fullyConnectedLayer(numClasses)
    softmaxLayer
    classificationLayer];

maxEpochs = 100;%最大训练周期数
miniBatchSize = 27;%分块尺寸

options = trainingOptions('adam', ...
    'ExecutionEnvironment','cpu', ...
    'MaxEpochs',maxEpochs, ...
    'MiniBatchSize',miniBatchSize, ...
    'GradientThreshold',1, ...
    'Verbose',false, ...
    'Plots','training-progress');

%% 训练
net=trainNetwork(XTrain,YTrain,layers, options)

%% 预测
YPred = classify(net,XTest, ...
    'MiniBatchSize',miniBatchSize, ...
    'SequenceLength','longest')
%% 精确度检验
acc = sum(YPred == YTest)./numel(YTest)