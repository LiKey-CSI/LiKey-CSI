%% 7��27�ո��¡������õ�����ת��������λ�ý������
%% �����ݰ��ղ���λ�÷ֳ�5��λ�ö�����˫֧����

clc;
clear;

path = './0802��������/single_number/Rev1/����1/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end

path = './0802��������/single_number/Rev1/����2/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end


path = './0802��������/single_number/Rev1/����3/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end

path = './0802��������/single_number/Rev1/����4/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end

path = './0802��������/single_number/Rev1/����5/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end

path = './0802��������/single_number/Rev1/����6/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end

path = './0802��������/single_number/Rev1/����7/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end

path = './0802��������/single_number/Rev1/����8/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end

path = './0802��������/single_number/Rev1/����9/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end

%% ÿ��λ�����ݵ����
loc1_Rev2_feature_mat = [];
count = 1;
for i = 1:9
    for j = 1:12
        eval(['loc1_Rev2_feature_mat(count,:,:) = [Rev2_number',num2str(i),'_',num2str(j),'];']); 
        count = count + 1;
    end
end

% loc2
loc2_Rev2_feature_mat = [];
count = 1;
for i = 1:9
    for j = 13:24
        eval(['loc2_Rev2_feature_mat(count,:,:) = [Rev2_number',num2str(i),'_',num2str(j),'];']); 
        count = count + 1;
    end
end

% loc3
loc3_Rev2_feature_mat = [];
count = 1;
for i = 1:9
    for j = 25:36
        eval(['loc3_Rev2_feature_mat(count,:,:) = [Rev2_number',num2str(i),'_',num2str(j),'];']); 
        count = count + 1;
    end
end

% loc4
loc4_Rev2_feature_mat = [];
count = 1;
for i = 1:9
    for j = 37:48
        eval(['loc4_Rev2_feature_mat(count,:,:) = [Rev2_number',num2str(i),'_',num2str(j),'];']); 
        count = count + 1;
    end
end

% loc5
loc5_Rev2_feature_mat = [];
count = 1;
for i = 1:9
    for j = 49:60
        eval(['loc5_Rev2_feature_mat(count,:,:) = [Rev2_number',num2str(i),'_',num2str(j),'];']); 
        count = count + 1;
    end
end

% loc6
loc6_Rev1_feature_mat = [];
count = 1;
for i = 1:9
    for j = 61:72
        eval(['loc6_Rev1_feature_mat(count,:,:) = [Rev1_number',num2str(i),'_',num2str(j),'];']); 
        count = count + 1;
    end
end

% loc7
loc7_Rev1_feature_mat = [];
count = 1;
for i = 1:9
    for j = 73:84
        eval(['loc7_Rev1_feature_mat(count,:,:) = [Rev1_number',num2str(i),'_',num2str(j),'];']); 
        count = count + 1;
    end
end

% loc8
loc8_Rev1_feature_mat = [];
count = 1;
for i = 1:9
    for j = 85:96
        eval(['loc8_Rev1_feature_mat(count,:,:) = [Rev1_number',num2str(i),'_',num2str(j),'];']); 
        count = count + 1;
    end
end

% loc9
loc9_Rev1_feature_mat = [];
count = 1;
for i = 1:9
    for j = 97:108
        eval(['loc9_Rev1_feature_mat(count,:,:) = [Rev1_number',num2str(i),'_',num2str(j),'];']); 
        count = count + 1;
    end
end


%% ���ϱ�ǩ
label_mat = [];
for i = 1:9
   label_mat = [label_mat;ones(12,1)*i]; 
end
label_mat = label_mat - 1;

    