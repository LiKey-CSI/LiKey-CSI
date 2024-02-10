%% 创建变量
final_feature_label(find(isnan(final_feature_label)==1)) = 0;
random_m = randperm(540);
final_feature_label = final_feature_label(random_m,:);
XTrain=final_feature_label(1:378,1:120);
YTrain=categorical(final_feature_label(1:378,121));%将数值数组转化为类别数组
XTest=final_feature_label(379:540,1:120);
YTest=categorical(final_feature_label(379:540,121));



XTrain = tonndata(XTrain',true,false)';
XTest = tonndata(XTest',true,false)';

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

