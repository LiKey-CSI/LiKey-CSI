%% 7��22�ո��¡������������ջ������ݷֿ������Ұ�ʵ�����鲿ȡ������˫֧�Ǹ�������
%% ͬʱ�����ݰ��ղ���λ�÷ֳ�5��λ�ö�����˫֧����

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
    eval(['tmp_real = fun_norm_one(real(number1_',num2str(i),' ));']);
    eval(['tmp_imag = fun_norm_one(imag(number1_',num2str(i),' ));']);
    for j = 1:30
        eval(['number1_',num2str(i),'(:,2*j-1)=tmp_real(:,j);']);
        eval(['number1_',num2str(i),'(:,2*j)=tmp_imag(:,j);']);
    end
end
for i = 1:l0
    eval(['Rev1_number1_',num2str(i),'=number1_',num2str(i),'(1:2:60,:);']);
    eval(['Rev2_number1_',num2str(i),'=number1_',num2str(i),'(2:2:60,:);']);
end

path = './0618��������/����2/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end
for i = 1:l0
    eval(['tmp_real = fun_norm_one(real(number2_',num2str(i),' ));']);
    eval(['tmp_imag = fun_norm_one(imag(number2_',num2str(i),' ));']);
    for j = 1:30
        eval(['number2_',num2str(i),'(:,2*j-1)=tmp_real(:,j);']);
        eval(['number2_',num2str(i),'(:,2*j)=tmp_imag(:,j);']);
    end
end
for i = 1:l0
    eval(['Rev1_number2_',num2str(i),'=number2_',num2str(i),'(1:2:60,:);']);
    eval(['Rev2_number2_',num2str(i),'=number2_',num2str(i),'(2:2:60,:);']);
end

path = './0618��������/����3/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end
for i = 1:l0
    eval(['tmp_real = fun_norm_one(real(number3_',num2str(i),' ));']);
    eval(['tmp_imag = fun_norm_one(imag(number3_',num2str(i),' ));']);
    for j = 1:30
        eval(['number3_',num2str(i),'(:,2*j-1)=tmp_real(:,j);']);
        eval(['number3_',num2str(i),'(:,2*j)=tmp_imag(:,j);']);
    end
end
for i = 1:l0
    eval(['Rev1_number3_',num2str(i),'=number3_',num2str(i),'(1:2:60,:);']);
    eval(['Rev2_number3_',num2str(i),'=number3_',num2str(i),'(2:2:60,:);']);
end

path = './0618��������/����4/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end
for i = 1:l0
    eval(['tmp_real = fun_norm_one(real(number4_',num2str(i),' ));']);
    eval(['tmp_imag = fun_norm_one(imag(number4_',num2str(i),' ));']);
    for j = 1:30
        eval(['number4_',num2str(i),'(:,2*j-1)=tmp_real(:,j);']);
        eval(['number4_',num2str(i),'(:,2*j)=tmp_imag(:,j);']);
    end
end
for i = 1:l0
    eval(['Rev1_number4_',num2str(i),'=number4_',num2str(i),'(1:2:60,:);']);
    eval(['Rev2_number4_',num2str(i),'=number4_',num2str(i),'(2:2:60,:);']);
end

path = './0618��������/����5/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end
for i = 1:l0
    eval(['tmp_real = fun_norm_one(real(number5_',num2str(i),' ));']);
    eval(['tmp_imag = fun_norm_one(imag(number5_',num2str(i),' ));']);
    for j = 1:30
        eval(['number5_',num2str(i),'(:,2*j-1)=tmp_real(:,j);']);
        eval(['number5_',num2str(i),'(:,2*j)=tmp_imag(:,j);']);
    end
end
for i = 1:l0
    eval(['Rev1_number5_',num2str(i),'=number5_',num2str(i),'(1:2:60,:);']);
    eval(['Rev2_number5_',num2str(i),'=number5_',num2str(i),'(2:2:60,:);']);
end


path = './0618��������/����6/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end
for i = 1:l0
    eval(['tmp_real = fun_norm_one(real(number6_',num2str(i),' ));']);
    eval(['tmp_imag = fun_norm_one(imag(number6_',num2str(i),' ));']);
    for j = 1:30
        eval(['number6_',num2str(i),'(:,2*j-1)=tmp_real(:,j);']);
        eval(['number6_',num2str(i),'(:,2*j)=tmp_imag(:,j);']);
    end
end
for i = 1:l0
    eval(['Rev1_number6_',num2str(i),'=number6_',num2str(i),'(1:2:60,:);']);
    eval(['Rev2_number6_',num2str(i),'=number6_',num2str(i),'(2:2:60,:);']);
end

path = './0618��������/����7/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end
for i = 1:l0
    eval(['tmp_real = fun_norm_one(real(number7_',num2str(i),' ));']);
    eval(['tmp_imag = fun_norm_one(imag(number7_',num2str(i),' ));']);
    for j = 1:30
        eval(['number7_',num2str(i),'(:,2*j-1)=tmp_real(:,j);']);
        eval(['number7_',num2str(i),'(:,2*j)=tmp_imag(:,j);']);
    end
end
for i = 1:l0
    eval(['Rev1_number7_',num2str(i),'=number7_',num2str(i),'(1:2:60,:);']);
    eval(['Rev2_number7_',num2str(i),'=number7_',num2str(i),'(2:2:60,:);']);
end

path = './0618��������/����8/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end
for i = 1:l0
    eval(['tmp_real = fun_norm_one(real(number8_',num2str(i),' ));']);
    eval(['tmp_imag = fun_norm_one(imag(number8_',num2str(i),' ));']);
    for j = 1:30
        eval(['number8_',num2str(i),'(:,2*j-1)=tmp_real(:,j);']);
        eval(['number8_',num2str(i),'(:,2*j)=tmp_imag(:,j);']);
    end
end
for i = 1:l0
    eval(['Rev1_number8_',num2str(i),'=number8_',num2str(i),'(1:2:60,:);']);
    eval(['Rev2_number8_',num2str(i),'=number8_',num2str(i),'(2:2:60,:);']);
end

path = './0618��������/����9/';
namelist = dir([path,'*.mat']);
l0 = length(namelist);
for i = 1:l0
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    load(filename{i});
end
for i = 1:l0
    eval(['tmp_real = fun_norm_one(real(number9_',num2str(i),' ));']);
    eval(['tmp_imag = fun_norm_one(imag(number9_',num2str(i),' ));']);
    for j = 1:30
        eval(['number9_',num2str(i),'(:,2*j-1)=tmp_real(:,j);']);
        eval(['number9_',num2str(i),'(:,2*j)=tmp_imag(:,j);']);
    end
end
for i = 1:l0
    eval(['Rev1_number9_',num2str(i),'=number9_',num2str(i),'(1:2:60,:);']);
    eval(['Rev2_number9_',num2str(i),'=number9_',num2str(i),'(2:2:60,:);']);
end

%% ÿ��λ�����ݵ����
loc1_Rev1_feature_mat = [];
count = 1;
for i = 1:9
    for j = 1:6
        eval(['loc1_Rev1_feature_mat(count,:,:) = [Rev1_number',num2str(i),'_',num2str(j),'];']); 
        count = count + 1;
    end
end

loc1_Rev2_feature_mat = [];
count = 1;
for i = 1:9
    for j = 1:6
        eval(['loc1_Rev2_feature_mat(count,:,:) = [Rev2_number',num2str(i),'_',num2str(j),'];']); 
        count = count + 1;
    end
end

% loc2
loc2_Rev1_feature_mat = [];
count = 1;
for i = 1:9
    for j = 7:12
        eval(['loc2_Rev1_feature_mat(count,:,:) = [Rev1_number',num2str(i),'_',num2str(j),'];']); 
        count = count + 1;
    end
end

loc2_Rev2_feature_mat = [];
count = 1;
for i = 1:9
    for j = 7:12
        eval(['loc2_Rev2_feature_mat(count,:,:) = [Rev2_number',num2str(i),'_',num2str(j),'];']); 
        count = count + 1;
    end
end

% loc3
loc3_Rev1_feature_mat = [];
count = 1;
for i = 1:9
    for j = 13:18
        eval(['loc3_Rev1_feature_mat(count,:,:) = [Rev1_number',num2str(i),'_',num2str(j),'];']); 
        count = count + 1;
    end
end

loc3_Rev2_feature_mat = [];
count = 1;
for i = 1:9
    for j = 13:18
        eval(['loc3_Rev2_feature_mat(count,:,:) = [Rev2_number',num2str(i),'_',num2str(j),'];']); 
        count = count + 1;
    end
end

% loc4
loc4_Rev1_feature_mat = [];
count = 1;
for i = 1:9
    for j = 19:24
        eval(['loc4_Rev1_feature_mat(count,:,:) = [Rev1_number',num2str(i),'_',num2str(j),'];']); 
        count = count + 1;
    end
end

loc4_Rev2_feature_mat = [];
count = 1;
for i = 1:9
    for j = 19:24
        eval(['loc4_Rev2_feature_mat(count,:,:) = [Rev2_number',num2str(i),'_',num2str(j),'];']); 
        count = count + 1;
    end
end

% loc5
loc5_Rev1_feature_mat = [];
count = 1;
for i = 1:9
    for j = 25:30
        eval(['loc5_Rev1_feature_mat(count,:,:) = [Rev1_number',num2str(i),'_',num2str(j),'];']); 
        count = count + 1;
    end
end

loc5_Rev2_feature_mat = [];
count = 1;
for i = 1:9
    for j = 25:30
        eval(['loc5_Rev2_feature_mat(count,:,:) = [Rev2_number',num2str(i),'_',num2str(j),'];']); 
        count = count + 1;
    end
end


%% ���ϱ�ǩ
label_mat = [];
for i = 1:9
   label_mat = [label_mat;ones(6,1)*i]; 
end
label_mat = label_mat - 1;

    