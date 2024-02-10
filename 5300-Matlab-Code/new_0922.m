clc;
clear;


loc9_Rev1_train = [];
loc9_Rev1_test = [];

loc9_Rev2_train = [];
loc9_Rev2_test = [];

train_label = [];
test_label = [];

for i = 1:9
    loc9_Rev1_test = [loc9_Rev1_test;loc9_Rev1_feature_mat(i*12-3:i*12,:,:)];
    loc9_Rev1_train = [loc9_Rev1_train;loc9_Rev1_feature_mat((i-1)*12+1:(i-1)*12+8,:,:)];
    
    loc9_Rev2_test = [loc9_Rev2_test;loc9_Rev2_feature_mat(i*12-3:i*12,:,:)];
    loc9_Rev2_train = [loc9_Rev2_train;loc9_Rev2_feature_mat((i-1)*12+1:(i-1)*12+8,:,:)];
    
    test_label = [test_label;label_mat(i*12-3:i*12,:)];
    train_label = [train_label;label_mat((i-1)*12+1:(i-1)*12+8,:)];
end