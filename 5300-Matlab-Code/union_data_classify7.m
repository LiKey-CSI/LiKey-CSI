%% ��30�����ز�����ת�����϶�Ϊһ
clc;
clear;

path = './0704��������/Rev1/����1/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end

path = './0704��������/Rev2/����1/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end

for j = 1:60
    eval(['number1_',num2str(j),'=[mode(Rev1_number1_',num2str(j),',1),mode(Rev2_number1_',num2str(j),',1)];']);
end


path = './0704��������/Rev1/����2/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end
path = './0704��������/Rev2/����2/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end

for j = 1:60
    eval(['number2_',num2str(j),'=[mode(Rev1_number2_',num2str(j),',1),mode(Rev2_number2_',num2str(j),',1)];']);
end

path = './0704��������/Rev1/����3/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end
path = './0704��������/Rev2/����3/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end

for j = 1:60
    eval(['number3_',num2str(j),'=[mode(Rev1_number3_',num2str(j),',1),mode(Rev2_number3_',num2str(j),',1)];']);
end

path = './0704��������/Rev1/����4/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end
path = './0704��������/Rev2/����4/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end

for j = 1:60
    eval(['number4_',num2str(j),'=[mode(Rev1_number4_',num2str(j),',1),mode(Rev2_number4_',num2str(j),',1)];']);
end

path = './0704��������/Rev1/����5/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end
path = './0704��������/Rev2/����5/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end

for j = 1:60
    eval(['number5_',num2str(j),'=[mode(Rev1_number5_',num2str(j),',1),mode(Rev2_number5_',num2str(j),',1)];']);
end

path = './0704��������/Rev1/����6/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end
path = './0704��������/Rev2/����6/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end

for j = 1:60
    eval(['number6_',num2str(j),'=[mode(Rev1_number6_',num2str(j),',1),mode(Rev2_number6_',num2str(j),',1)];']);
end

path = './0704��������/Rev1/����7/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end
path = './0704��������/Rev2/����7/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end

for j = 1:60
    eval(['number7_',num2str(j),'=[mode(Rev1_number7_',num2str(j),',1),mode(Rev2_number7_',num2str(j),',1)];']);
end

path = './0704��������/Rev1/����8/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end
path = './0704��������/Rev2/����8/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end

for j = 1:60
    eval(['number8_',num2str(j),'=[mode(Rev1_number8_',num2str(j),',1),mode(Rev2_number8_',num2str(j),',1)];']);
end

path = './0704��������/Rev1/����9/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end
path = './0704��������/Rev2/����9/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end

for j = 1:60
    eval(['number9_',num2str(j),'=[mode(Rev1_number9_',num2str(j),',1),mode(Rev2_number9_',num2str(j),',1)];']);
end

%% ȫ����װ�ɴ����
feature_mat = [];
for i = 1:9
    for j = 1:60
        eval(['feature_mat = [feature_mat;number',num2str(i),'_',num2str(j),'];']);
    end
end

label_mat = [];
for i = 1:9
   label_mat = [label_mat;ones(60,1)*i]; 
end

final_feature_label = [feature_mat label_mat];