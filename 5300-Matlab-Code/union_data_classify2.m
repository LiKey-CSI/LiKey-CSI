%% 7月6日更新——将两个接收机的数据分开，构成双支复数特征
clc;
clear;

path = './0618按键特征/按键1/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%通过字符串拼接获得的就是绝对路径了
    load(filename{i});
end
for i = 1:l0
    eval(['Rev1_number1_',num2str(i),'=number1_',num2str(i),'(1:2:60,:);']);
    eval(['Rev2_number1_',num2str(i),'=number1_',num2str(i),'(2:2:60,:);']);
end

path = './0618按键特征/按键2/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%通过字符串拼接获得的就是绝对路径了
    load(filename{i});
end
for i = 1:l0
    eval(['Rev1_number2_',num2str(i),'=number2_',num2str(i),'(1:2:60,:);']);
    eval(['Rev2_number2_',num2str(i),'=number2_',num2str(i),'(2:2:60,:);']);
end

path = './0618按键特征/按键3/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%通过字符串拼接获得的就是绝对路径了
    load(filename{i});
end
for i = 1:l0
    eval(['Rev1_number3_',num2str(i),'=number3_',num2str(i),'(1:2:60,:);']);
    eval(['Rev2_number3_',num2str(i),'=number3_',num2str(i),'(2:2:60,:);']);
end

path = './0618按键特征/按键4/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%通过字符串拼接获得的就是绝对路径了
    load(filename{i});
end
for i = 1:l0
    eval(['Rev1_number4_',num2str(i),'=number4_',num2str(i),'(1:2:60,:);']);
    eval(['Rev2_number4_',num2str(i),'=number4_',num2str(i),'(2:2:60,:);']);
end

path = './0618按键特征/按键5/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%通过字符串拼接获得的就是绝对路径了
    load(filename{i});
end
for i = 1:l0
    eval(['Rev1_number5_',num2str(i),'=number5_',num2str(i),'(1:2:60,:);']);
    eval(['Rev2_number5_',num2str(i),'=number5_',num2str(i),'(2:2:60,:);']);
end


path = './0618按键特征/按键6/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%通过字符串拼接获得的就是绝对路径了
    load(filename{i});
end
for i = 1:l0
    eval(['Rev1_number6_',num2str(i),'=number6_',num2str(i),'(1:2:60,:);']);
    eval(['Rev2_number6_',num2str(i),'=number6_',num2str(i),'(2:2:60,:);']);
end

path = './0618按键特征/按键7/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%通过字符串拼接获得的就是绝对路径了
    load(filename{i});
end
for i = 1:l0
    eval(['Rev1_number7_',num2str(i),'=number7_',num2str(i),'(1:2:60,:);']);
    eval(['Rev2_number7_',num2str(i),'=number7_',num2str(i),'(2:2:60,:);']);
end

path = './0618按键特征/按键8/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%通过字符串拼接获得的就是绝对路径了
    load(filename{i});
end
for i = 1:l0
    eval(['Rev1_number8_',num2str(i),'=number8_',num2str(i),'(1:2:60,:);']);
    eval(['Rev2_number8_',num2str(i),'=number8_',num2str(i),'(2:2:60,:);']);
end

path = './0618按键特征/按键9/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%通过字符串拼接获得的就是绝对路径了
    load(filename{i});
end
for i = 1:l0
    eval(['Rev1_number9_',num2str(i),'=number9_',num2str(i),'(1:2:60,:);']);
    eval(['Rev2_number9_',num2str(i),'=number9_',num2str(i),'(2:2:60,:);']);
end

%% 组合为一个所有按键标签和特征的矩阵
Rev1_feature_mat = [];
count = 1;
for i = 1:9
    for j = 1:30
        eval(['Rev1_feature_mat(count,:,:) = [Rev1_number',num2str(i),'_',num2str(j),'];']); 
        count = count + 1;
    end
end

Rev2_feature_mat = [];
count = 1;
for i = 1:9
    for j = 1:30
        eval(['Rev2_feature_mat(count,:,:) = [Rev2_number',num2str(i),'_',num2str(j),'];']); 
        count = count + 1;
    end
end



%% 生成标签矩阵
label_mat = [];
for i = 1:9
   label_mat = [label_mat;ones(30,1)*i]; 
end
