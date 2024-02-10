%% ��������
final_feature_label(find(isnan(final_feature_label)==1)) = 0;
random_m = randperm(540);
final_feature_label = final_feature_label(random_m,:);
XTrain=final_feature_label(1:378,1:120);
YTrain=categorical(final_feature_label(1:378,121));%����ֵ����ת��Ϊ�������
XTest=final_feature_label(379:540,1:120);
YTest=categorical(final_feature_label(379:540,121));



XTrain = tonndata(XTrain',true,false)';
XTest = tonndata(XTest',true,false)';

%% ����LSTM����
inputSize = 120;%������ά��
numHiddenUnits = 100;%LSTM��·���������ص�Ԫ��Ŀ
numClasses = 9;%label��ǩ������,��������Ϊ����

layers = [ ...
    sequenceInputLayer(inputSize)
    lstmLayer(numHiddenUnits,'OutputMode','last')
    fullyConnectedLayer(numClasses)
    softmaxLayer
    classificationLayer];

maxEpochs = 100;%���ѵ��������
miniBatchSize = 27;%�ֿ�ߴ�

options = trainingOptions('adam', ...
    'ExecutionEnvironment','cpu', ...
    'MaxEpochs',maxEpochs, ...
    'MiniBatchSize',miniBatchSize, ...
    'GradientThreshold',1, ...
    'Verbose',false, ...
    'Plots','training-progress');

%% ѵ��
net=trainNetwork(XTrain,YTrain,layers, options)

%% Ԥ��
YPred = classify(net,XTest, ...
    'MiniBatchSize',miniBatchSize, ...
    'SequenceLength','longest')
%% ��ȷ�ȼ���
acc = sum(YPred == YTest)./numel(YTest)

