%% 功能函数：用于按照索引对旋转特征进行累加

function sum_point = func_sum_point(rotate_feature)
    sum_point = zeros(length(rotate_feature),1);
    for i = 1:length(rotate_feature)
       sum_point(i,1) = sum(rotate_feature(1,1:i)); 
    end
    sum_point = sum_point';
end