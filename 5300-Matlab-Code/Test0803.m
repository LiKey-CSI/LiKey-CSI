clc;
clear;

loc6_Rev2_feature_mat(find(isnan(loc6_Rev2_feature_mat)==1)) = 0;
for i = 1:108
    tmp_feature = squeeze(loc6_Rev2_feature_mat(i,:,:));
    for j = 1:30
        tmp_feature(j,:) = func_sum_point(tmp_feature(j,:));
    end
    tmp_feature = fun_allNormalized_1(tmp_feature);
    loc6_Rev2_feature_mat(i,:,:) = tmp_feature;
end

show_index = 3;
rev1_number = squeeze(loc2_Rev1_feature_mat(show_index,:,:));
rev2_number = squeeze(loc2_Rev2_feature_mat(show_index,:,:));

figure;
subplot(2,1,1);
plot(rev1_number(16,:));
subplot(2,1,2);
plot(rev2_number(16,:));

before = 26;
after = 28;
loc6_Rev1_feature_mat(before,:,:) = loc6_Rev1_feature_mat(after,:,:);
loc6_Rev2_feature_mat(before,:,:) = loc6_Rev2_feature_mat(after,:,:);


loc8_Rev1_feature_mat(85:96,:,:) = loc9_Rev1_feature_mat(85:96,:,:);
loc8_Rev2_feature_mat(85:96,:,:) = loc9_Rev2_feature_mat(85:96,:,:);

figure;
for show_index = 37:42
    rev1_number = squeeze(loc3_Rev1_feature_mat(show_index,:,:));
    rev2_number = squeeze(loc3_Rev2_feature_mat(show_index,:,:));
    subplot(6,2,(show_index-36)*2-1);
    plot(rev1_number(16,:));
    subplot(6,2,(show_index-36)*2);
    plot(rev2_number(16,:));
end

figure;
for show_index = 91:96
    rev1_number = squeeze(loc6_Rev1_feature_mat(show_index,:,:));
    rev2_number = squeeze(loc6_Rev2_feature_mat(show_index,:,:));
    subplot(6,2,(show_index-90)*2-1);
    plot(rev1_number(16,:));
    subplot(6,2,(show_index-90)*2);
    plot(rev2_number(16,:));
end

before = 96;
after = 92;
loc6_Rev1_feature_mat(before,:,:) = loc6_Rev1_feature_mat(after,:,:);
% loc1_Rev1_feature_mat(before,:,:) = loc1_Rev1_feature_mat(after,:,:);
loc6_Rev2_feature_mat(before,:,:) = loc6_Rev2_feature_mat(after,:,:);
