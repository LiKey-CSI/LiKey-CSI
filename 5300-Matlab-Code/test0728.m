figure;
plot(number6_2,'ro');

sum_arr = zeros(length(number6_20),1);
for i = 1:length(number6_3)
   sum_arr(i,1) = sum(number6_20(1,1:i)); 
end

figure;
plot(sum_arr);


for i = 1:9
    for j = 1:60
        eval(['number',num2str(i),'_',num2str(j),'(find(isnan(number',num2str(i),'_',num2str(j),')==1))=0;']);
    end
end


for i = 1:9
    for j = 1:60
        eval(['number',num2str(i),'_',num2str(j),'=func_sum_point(number',num2str(i),'_',num2str(j),');']);
    end
end

for i = 1:9
    for j = 1:60
        eval(['number',num2str(i),'_',num2str(j),'=func_one_Normalized(number',num2str(i),'_',num2str(j),');']);
    end
end


start_pos = 24;
figure;
for i = 1:6
   subplot(3,2,i);
   eval(['plot(number5_',num2str(start_pos+i),');']);
end
% figure;
% subplot(3,2,1);
% plot(number6_53);
% subplot(3,2,2);
% plot(number6_58);

for i = 1:60
    for j = 1:60
        if(i~=j)
            eval(['dtw_',num2str(i),'_',num2str(j),'=MyDTW(number6_',num2str(i),',','number6_',num2str(j),');']);
        end
    end
end
MyDTW(number6_1,number8_55)


%% 构建训练集样本和标签
traindata = [];
length_train = 36;
for i=1:length_train    
    eval(['traindata = [traindata;number1_',num2str(i),'];']);
end
for i=1:length_train   
    eval(['traindata = [traindata;number2_',num2str(i),'];']);
end
for i=1:length_train  
    eval(['traindata = [traindata;number3_',num2str(i),'];']);
end
for i=1:length_train  
    eval(['traindata = [traindata;number4_',num2str(i),'];']);
end
for i=1:length_train    
    eval(['traindata = [traindata;number5_',num2str(i),'];']);
end
for i=1:length_train
    eval(['traindata = [traindata;number6_',num2str(i),'];']);
end
for i=1:length_train    
    eval(['traindata = [traindata;number7_',num2str(i),'];']);
end
for i=1:length_train  
    eval(['traindata = [traindata;number8_',num2str(i),'];']);
end
for i=1:length_train   
    eval(['traindata = [traindata;number9_',num2str(i),'];']);
end

trainlabel = [1*ones(length_train,1);2*ones(length_train,1);3*ones(length_train,1);4*ones(length_train,1);5*ones(length_train,1);6*ones(length_train,1);7*ones(length_train,1);8*ones(length_train,1);9*ones(length_train,1)];

%% 构建测试集样本和标签
testdata = [];
for i = length_train+1:60
    eval(['testdata = [testdata;number1_',num2str(i),'];']);
end
for i = length_train+1:60
    eval(['testdata = [testdata;number2_',num2str(i),'];']);
end
for i = length_train+1:60
    eval(['testdata = [testdata;number3_',num2str(i),'];']);
end
for i = length_train+1:60
    eval(['testdata = [testdata;number4_',num2str(i),'];']);
end
for i = length_train+1:60
    eval(['testdata = [testdata;number5_',num2str(i),'];']);
end
for i = length_train+1:60
    eval(['testdata = [testdata;number6_',num2str(i),'];']);
end
for i = length_train+1:60
    eval(['testdata = [testdata;number7_',num2str(i),'];']);
end
for i = length_train+1:60
    eval(['testdata = [testdata;number8_',num2str(i),'];']);
end
for i = length_train+1:60
    eval(['testdata = [testdata;number9_',num2str(i),'];']);
end

testlabel = [1*ones(60-length_train,1);2*ones(60-length_train,1);3*ones(60-length_train,1);4*ones(60-length_train,1);5*ones(60-length_train,1);6*ones(60-length_train,1);7*ones(60-length_train,1);8*ones(60-length_train,1);9*ones(60-length_train,1)];

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
