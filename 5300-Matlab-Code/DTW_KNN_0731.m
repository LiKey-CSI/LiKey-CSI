clc;
clear;

path = './0704��������/snow��/Rev1/����1/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end

path = './0704��������/snow��/Rev2/����1/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end

for j = 1:60
    eval(['number1_',num2str(j),'=[mode(Rev1_number1_',num2str(j),',1),mode(Rev2_number1_',num2str(j),',1)];']);
end


path = './0704��������/snow��/Rev1/����2/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end
path = './0704��������/snow��/Rev2/����2/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end

for j = 1:60
    eval(['number2_',num2str(j),'=[mode(Rev1_number2_',num2str(j),',1),mode(Rev2_number2_',num2str(j),',1)];']);
end

path = './0704��������/snow��/Rev1/����3/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end
path = './0704��������/snow��/Rev2/����3/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end

for j = 1:60
    eval(['number3_',num2str(j),'=[mode(Rev1_number3_',num2str(j),',1),mode(Rev2_number3_',num2str(j),',1)];']);
end

path = './0704��������/snow��/Rev1/����4/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end
path = './0704��������/snow��/Rev2/����4/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end

for j = 1:60
    eval(['number4_',num2str(j),'=[mode(Rev1_number4_',num2str(j),',1),mode(Rev2_number4_',num2str(j),',1)];']);
end

path = './0704��������/snow��/Rev1/����5/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end
path = './0704��������/snow��/Rev2/����5/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end

for j = 1:60
    eval(['number5_',num2str(j),'=[mode(Rev1_number5_',num2str(j),',1),mode(Rev2_number5_',num2str(j),',1)];']);
end

path = './0704��������/snow��/Rev1/����6/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end
path = './0704��������/snow��/Rev2/����6/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end

for j = 1:60
    eval(['number6_',num2str(j),'=[mode(Rev1_number6_',num2str(j),',1),mode(Rev2_number6_',num2str(j),',1)];']);
end

path = './0704��������/snow��/Rev1/����7/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end
path = './0704��������/snow��/Rev2/����7/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end

for j = 1:60
    eval(['number7_',num2str(j),'=[mode(Rev1_number7_',num2str(j),',1),mode(Rev2_number7_',num2str(j),',1)];']);
end

path = './0704��������/snow��/Rev1/����8/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end
path = './0704��������/snow��/Rev2/����8/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end

for j = 1:60
    eval(['number8_',num2str(j),'=[mode(Rev1_number8_',num2str(j),',1),mode(Rev2_number8_',num2str(j),',1)];']);
end

path = './0704��������/snow��/Rev1/����9/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end
path = './0704��������/snow��/Rev2/����9/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end

for j = 1:60
    eval(['number9_',num2str(j),'=[mode(Rev1_number9_',num2str(j),',1),mode(Rev2_number9_',num2str(j),',1)];']);
end

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

%% ����ѵ���������ͱ�ǩ
traindata = [];
length_train = 12;
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

%% �������Լ������ͱ�ǩ
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

%% ����DTW��KNN����
K=6;%�����������ڽ�������
sum = 0;
prediction = [];
for times = 1:length(testdata)
    tmp_testdata = testdata(times,:);
    [N,M] = size(traindata);
    %����ѵ�����ݼ��Ͳ�������֮���DWT����
    dist = zeros(N,1);
    for i=1:N
        dist(i,:) = MyDTW(traindata(i,:),tmp_testdata);
    end

    %��dist��С�����������
    [Y,I]=sort(dist,1);   
    %��ѵ�����ݶ�Ӧ�������ѵ��������������Ӧ
    tmp_trainlabel=trainlabel(I);
    %ȷ��ǰK�����������ĳ���Ƶ��
    classNum=length(unique(tmp_trainlabel));%ȡ�����еĵ�ֵԪ�صĸ���
    labels=zeros(1,classNum);
    for t=1:K
        j=tmp_trainlabel(t);
        labels(j)=labels(j)+1;
    end

    %����ǰK�����г���Ƶ����ߵ������Ϊ�������ݵ�Ԥ�����
    [~,idx]=max(labels);
%     fprintf('�ò������������� %d\n',idx);
    prediction = [prediction;idx];
    if idx == testlabel(times)
        sum = sum + 1;
    end
end

%% չʾ����KNN�ķ�����
acc = sum/length(testlabel)*100;
figure;
plot(1:length(testlabel),testlabel.','r-*')
hold on
plot(1:length(testlabel),prediction.','b:o')
grid on
legend('��ʵ���','Ԥ�����')
xlabel('���Լ��������')
ylabel('���Լ��������')
string = {'���Լ�KNNԤ����';
          ['׼ȷ�� = ' num2str(acc) '%']};
title(string)