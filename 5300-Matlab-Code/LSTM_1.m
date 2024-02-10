%% 7��6�ո��£�ʹ��LSTMģ�ͣ����������Ǹ����������Ǹ���
clc;
clear;
%% �������ݼ�
load('C:\Users\winlab\Desktop\CSI�������ʶ��\����������֤����\0618��������\���ѧϰ��������\LSTM\all_data.mat');

%% �����ݼ����зָ�
[data_r,data_c] = size(feaure_label);
%��������������ָ��10����
indices = crossvalind('Kfold',data_r,10);

%% ����ģ�Ͳ���
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
    % ��ȡ��i�ݲ������ݵ������߼�ֵ
    test = (indices == i);
    % ȡ������ȡ��i��ѵ�����ݵ������߼�ֵ
    train = ~test;
    %1�ݲ��ԣ�9��ѵ��
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