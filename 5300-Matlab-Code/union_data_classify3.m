%% 7月6日更新——将两个接收机的数据分开，并且把实部和虚部取出构成双支非复数特征
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
    eval(['tmp_real = real(number1_',num2str(i),' );']);
    eval(['tmp_imag = imag(number1_',num2str(i),' );']);
    for j = 1:30
        eval(['number1_',num2str(i),'(:,2*j-1)=tmp_real(:,j);']);
        eval(['number1_',num2str(i),'(:,2*j)=tmp_imag(:,j);']);
    end
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
    eval(['tmp_real = real(number2_',num2str(i),' );']);
    eval(['tmp_imag = imag(number2_',num2str(i),' );']);
    for j = 1:30
        eval(['number2_',num2str(i),'(:,2*j-1)=tmp_real(:,j);']);
        eval(['number2_',num2str(i),'(:,2*j)=tmp_imag(:,j);']);
    end
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
    eval(['tmp_real = real(number3_',num2str(i),' );']);
    eval(['tmp_imag = imag(number3_',num2str(i),' );']);
    for j = 1:30
        eval(['number3_',num2str(i),'(:,2*j-1)=tmp_real(:,j);']);
        eval(['number3_',num2str(i),'(:,2*j)=tmp_imag(:,j);']);
    end
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
    eval(['tmp_real = real(number4_',num2str(i),' );']);
    eval(['tmp_imag = imag(number4_',num2str(i),' );']);
    for j = 1:30
        eval(['number4_',num2str(i),'(:,2*j-1)=tmp_real(:,j);']);
        eval(['number4_',num2str(i),'(:,2*j)=tmp_imag(:,j);']);
    end
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
    eval(['tmp_real = real(number5_',num2str(i),' );']);
    eval(['tmp_imag = imag(number5_',num2str(i),' );']);
    for j = 1:30
        eval(['number5_',num2str(i),'(:,2*j-1)=tmp_real(:,j);']);
        eval(['number5_',num2str(i),'(:,2*j)=tmp_imag(:,j);']);
    end
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
    eval(['tmp_real = real(number6_',num2str(i),' );']);
    eval(['tmp_imag = imag(number6_',num2str(i),' );']);
    for j = 1:30
        eval(['number6_',num2str(i),'(:,2*j-1)=tmp_real(:,j);']);
        eval(['number6_',num2str(i),'(:,2*j)=tmp_imag(:,j);']);
    end
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
    eval(['tmp_real = real(number7_',num2str(i),' );']);
    eval(['tmp_imag = imag(number7_',num2str(i),' );']);
    for j = 1:30
        eval(['number7_',num2str(i),'(:,2*j-1)=tmp_real(:,j);']);
        eval(['number7_',num2str(i),'(:,2*j)=tmp_imag(:,j);']);
    end
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
    eval(['tmp_real = real(number8_',num2str(i),' );']);
    eval(['tmp_imag = imag(number8_',num2str(i),' );']);
    for j = 1:30
        eval(['number8_',num2str(i),'(:,2*j-1)=tmp_real(:,j);']);
        eval(['number8_',num2str(i),'(:,2*j)=tmp_imag(:,j);']);
    end
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
    eval(['tmp_real = real(number9_',num2str(i),' );']);
    eval(['tmp_imag = imag(number9_',num2str(i),' );']);
    for j = 1:30
        eval(['number9_',num2str(i),'(:,2*j-1)=tmp_real(:,j);']);
        eval(['number9_',num2str(i),'(:,2*j)=tmp_imag(:,j);']);
    end
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

%% 打上标签
label_mat = [];
for i = 1:9
   label_mat = [label_mat;ones(30,1)*i]; 
end
label_mat = label_mat - 1;