%% 6��29�� �������а����������ݲ����ǩ����Ϊ������������
clc;
clear;

path = './0618��������/����1/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end
for i = 1:l0
    eval(['number1_',num2str(i),'=transpose(number1_',num2str(i),');']);
    eval(['number1_',num2str(i),'=number1_',num2str(i),'(:);']);
    eval(['number1_',num2str(i),'=transpose(number1_',num2str(i),');']);
end

path = './0618��������/����2/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end
for i = 1:l0
    eval(['number2_',num2str(i),'=transpose(number2_',num2str(i),');']);
    eval(['number2_',num2str(i),'=number2_',num2str(i),'(:);']);
    eval(['number2_',num2str(i),'=transpose(number2_',num2str(i),');']);
end

path = './0618��������/����3/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end
for i = 1:l0
    eval(['number3_',num2str(i),'=transpose(number3_',num2str(i),');']);
    eval(['number3_',num2str(i),'=number3_',num2str(i),'(:);']);
    eval(['number3_',num2str(i),'=transpose(number3_',num2str(i),');']);
end

path = './0618��������/����4/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end
for i = 1:l0
    eval(['number4_',num2str(i),'=transpose(number4_',num2str(i),');']);
    eval(['number4_',num2str(i),'=number4_',num2str(i),'(:);']);
    eval(['number4_',num2str(i),'=transpose(number4_',num2str(i),');']);
end

path = './0618��������/����5/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end
for i = 1:l0
    eval(['number5_',num2str(i),'=transpose(number5_',num2str(i),');']);
    eval(['number5_',num2str(i),'=number5_',num2str(i),'(:);']);
    eval(['number5_',num2str(i),'=transpose(number5_',num2str(i),');']);
end


path = './0618��������/����6/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end
for i = 1:l0
    eval(['number6_',num2str(i),'=transpose(number6_',num2str(i),');']);
    eval(['number6_',num2str(i),'=number6_',num2str(i),'(:);']);
    eval(['number6_',num2str(i),'=transpose(number6_',num2str(i),');']);
end

path = './0618��������/����7/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end
for i = 1:l0
    eval(['number7_',num2str(i),'=transpose(number7_',num2str(i),');']);
    eval(['number7_',num2str(i),'=number7_',num2str(i),'(:);']);
    eval(['number7_',num2str(i),'=transpose(number7_',num2str(i),');']);
end

path = './0618��������/����8/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end
for i = 1:l0
    eval(['number8_',num2str(i),'=transpose(number8_',num2str(i),');']);
    eval(['number8_',num2str(i),'=number8_',num2str(i),'(:);']);
    eval(['number8_',num2str(i),'=transpose(number8_',num2str(i),');']);
end

path = './0618��������/����9/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end
for i = 1:l0
    eval(['number9_',num2str(i),'=transpose(number9_',num2str(i),');']);
    eval(['number9_',num2str(i),'=number9_',num2str(i),'(:);']);
    eval(['number9_',num2str(i),'=transpose(number9_',num2str(i),');']);
end

%% ���Ϊһ�����а�����ǩ�������ľ���
feature_mat = [];
for i = 1:9
    for j = 1:30
        eval(['feature_mat = [feature_mat;number',num2str(i),'_',num2str(j),'];']); 
    end
end

new_feature_mat = [];
real_feature_mat = real(feature_mat);
imag_feature_mat = imag(feature_mat);
for i = 1:length(feature_mat)
    tmp_mat = [real_feature_mat(:,i) imag_feature_mat(:,i)];
    new_feature_mat = [new_feature_mat tmp_mat];
end

%% ���ϱ�ǩ
label_mat = [];
for i = 1:9
   label_mat = [label_mat;ones(30,1)*i]; 
end

feaure_label = [new_feature_mat label_mat];