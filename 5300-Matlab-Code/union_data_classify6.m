%% 7月27日更新——将得到的旋转特征按照位置进行组合
%% 将数据按照测试位置分成5个位置独立的双支特征

clc;
clear;

path = './0802按键特征/single_number/Rev1/按键1/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%通过字符串拼接获得的就是绝对路径了
    load(filename{i});
end

path = './0802按键特征/single_number/Rev1/按键2/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%通过字符串拼接获得的就是绝对路径了
    load(filename{i});
end


path = './0802按键特征/single_number/Rev1/按键3/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%通过字符串拼接获得的就是绝对路径了
    load(filename{i});
end

path = './0802按键特征/single_number/Rev1/按键4/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%通过字符串拼接获得的就是绝对路径了
    load(filename{i});
end

path = './0802按键特征/single_number/Rev1/按键5/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%通过字符串拼接获得的就是绝对路径了
    load(filename{i});
end

path = './0802按键特征/single_number/Rev1/按键6/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%通过字符串拼接获得的就是绝对路径了
    load(filename{i});
end

path = './0802按键特征/single_number/Rev1/按键7/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%通过字符串拼接获得的就是绝对路径了
    load(filename{i});
end

path = './0802按键特征/single_number/Rev1/按键8/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%通过字符串拼接获得的就是绝对路径了
    load(filename{i});
end

path = './0802按键特征/single_number/Rev1/按键9/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%通过字符串拼接获得的就是绝对路径了
    load(filename{i});
end

%% 每个位置数据的组合
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


%% 打上标签
label_mat = [];
for i = 1:9
   label_mat = [label_mat;ones(12,1)*i]; 
end
label_mat = label_mat - 1;

    