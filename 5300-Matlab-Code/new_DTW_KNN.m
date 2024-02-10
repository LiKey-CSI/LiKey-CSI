clc;
clear;

path = './0802��������/��ת����/location_sum/loc1/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end

loc1_feature = zeros(108,120);
for i = 1:108
    tmp1 = squeeze(loc1_Rev1_feature_mat(i,:,:));
    tmp2 = squeeze(loc1_Rev2_feature_mat(i,:,:));
    tmp = [tmp1(16,:),tmp2(16,:)];
    loc1_feature(i,:) = tmp;
end

path = './0802��������/��ת����/location_sum/loc2/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end

loc2_feature = zeros(108,120);
for i = 1:108
    tmp1 = squeeze(loc2_Rev1_feature_mat(i,:,:));
    tmp2 = squeeze(loc2_Rev2_feature_mat(i,:,:));
    tmp = [tmp1(16,:),tmp2(16,:)];
    loc2_feature(i,:) = tmp;
end

path = './0802��������/��ת����/location_sum/loc3/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end

loc3_feature = zeros(108,120);
for i = 1:108
    tmp1 = squeeze(loc3_Rev1_feature_mat(i,:,:));
    tmp2 = squeeze(loc3_Rev2_feature_mat(i,:,:));
    tmp = [tmp1(16,:),tmp2(16,:)];
    loc3_feature(i,:) = tmp;
end

path = './0802��������/��ת����/location_sum/loc4/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end

loc4_feature = zeros(108,120);
for i = 1:108
    tmp1 = squeeze(loc4_Rev1_feature_mat(i,:,:));
    tmp2 = squeeze(loc4_Rev2_feature_mat(i,:,:));
    tmp = [tmp1(16,:),tmp2(16,:)];
    loc4_feature(i,:) = tmp;
end

path = './0802��������/��ת����/location_sum/loc5/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end

loc5_feature = zeros(108,120);
for i = 1:108
    tmp1 = squeeze(loc5_Rev1_feature_mat(i,:,:));
    tmp2 = squeeze(loc5_Rev2_feature_mat(i,:,:));
    tmp = [tmp1(16,:),tmp2(16,:)];
    loc5_feature(i,:) = tmp;
end

path = './0802��������/��ת����/location_sum/loc6/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end

loc6_feature = zeros(108,120);
for i = 1:108
    tmp1 = squeeze(loc6_Rev1_feature_mat(i,:,:));
    tmp2 = squeeze(loc6_Rev2_feature_mat(i,:,:));
    tmp = [tmp1(16,:),tmp2(16,:)];
    loc6_feature(i,:) = tmp;
end

path = './0802��������/��ת����/location_sum/loc7/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end

loc7_feature = zeros(108,120);
for i = 1:108
    tmp1 = squeeze(loc7_Rev1_feature_mat(i,:,:));
    tmp2 = squeeze(loc7_Rev2_feature_mat(i,:,:));
    tmp = [tmp1(16,:),tmp2(16,:)];
    loc7_feature(i,:) = tmp;
end

path = './0802��������/��ת����/location_sum/loc8/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end

loc8_feature = zeros(108,120);
for i = 1:108
    tmp1 = squeeze(loc8_Rev1_feature_mat(i,:,:));
    tmp2 = squeeze(loc8_Rev2_feature_mat(i,:,:));
    tmp = [tmp1(16,:),tmp2(16,:)];
    loc8_feature(i,:) = tmp;
end

path = './0802��������/��ת����/location_sum/loc9/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
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

%% ����ѵ�����Ͳ��Լ�
traindata = [loc6_feature;loc1_feature;loc7_feature;loc9_feature;loc2_feature;];
testdata = [loc8_feature;loc5_feature;loc3_feature;loc4_feature];
trainlabel = [label_mat;label_mat;label_mat;label_mat;label_mat;];
trainlabel = trainlabel+1;
testlabel = [label_mat;label_mat;label_mat;label_mat];
testlabel = testlabel + 1;

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