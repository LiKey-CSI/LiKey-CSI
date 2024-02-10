%% 将每个位置所有的按键样本进行组合，后续用于分类
clc;
clear;

path1 = 'D:\Study\科研\LIKEY\补充实验\补充实验1\Size_2cm\data_feature_60\Rev1\loc9\';
namelist = dir([path1,'*.mat']);
l1 = length(namelist);
for i = 1:l1
    file_name = [path1,namelist(i).name];
    load(file_name);
end


path2 = 'D:\Study\科研\LIKEY\补充实验\补充实验1\Size_2cm\data_feature_60\Rev2\loc9\';
namelist2 = dir([path2,'*.mat']);
l2 = length(namelist2);
for i = 1:l1
    file_name = [path2,namelist2(i).name];
    load(file_name);
end


loc9_Rev1_feature_mat = [];
count = 1;
for i = 1:9
    for j = 1:12
        eval(['loc9_Rev1_feature_mat(count,:,:) = [Rev1_number',num2str(i),'_',num2str(j),'];']);
        count = count + 1;
    end
end

loc9_Rev2_feature_mat = [];
count = 1;
for i = 1:9
    for j = 1:12
        eval(['loc9_Rev2_feature_mat(count,:,:) = [Rev2_number',num2str(i),'_',num2str(j),'];']);
        count = count + 1;
    end
end


%% 打上标签
label_mat = [];
for i = 1:9
    label_mat = [label_mat;ones(12,1)*i];
end
label_mat = label_mat - 1;