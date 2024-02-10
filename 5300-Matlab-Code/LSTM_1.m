%% 7月6日更新，使用LSTM模型，数据特征是浮点数，不是复数
clc;
clear;
%% 载入数据集
load('C:\Users\winlab\Desktop\CSI按键身份识别\菲涅尔区验证代码\0618按键特征\深度学习分类特征\LSTM\all_data.mat');

%% 将数据集进行分割
[data_r,data_c] = size(feaure_label);
%将数据样本随机分割成10部分
indices = crossvalind('Kfold',data_r,10);

%% 网络模型参数
layers = [
    sequenceInputLayer(3600,"Name","input")
    lstmLayer(128,"Name","lstm","OutputMode","last")
    dropoutLayer(0.5,"Name","dropout")
    fullyConnectedLayer(9,"Name","fc")
    softmaxLayer("Name","softmax")
    classificationLayer("Name","classification")];

options = trainingOptions('adam', ...
    'MaxEpochs',40, ...
    'GradientThreshold',1, ...
    'InitialLearnRate',0.005, ...
    'LearnRateSchedule','piecewise', ...
    'LearnRateDropPeriod',125, ...
    'LearnRateDropFactor',0.2, ...
    'Verbose',0, ...
    'MiniBatchSize',10, ...
    'Plots','training-progress'); 

acc = zeros(10,1);

for i = 1:10
    % 获取第i份测试数据的索引逻辑值
    test = (indices == i);
    % 取反，获取第i份训练数据的索引逻辑值
    train = ~test;
    %1份测试，9份训练
    test_data = feaure_label(test, 1 : data_c - 1).';
    test_label = feaure_label(test, data_c);
    
    train_data = feaure_label(train, 1 : data_c - 1).';
    train_label = feaure_label(train, data_c);
    
    train_data = tonndata(train_data,true,false);
    test_data = tonndata(test_data,true,false);
    train_label = categorical(train_label);
    test_label = categorical(test_label);
    
    net = trainNetwork(train_data,train_label,layers,options);
    
    pred_label = classify(net,test_data);
    acc(i) = sum(pred_label == test_label)./numel(test_label);
    
end

figure;
bar(acc);