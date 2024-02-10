%% 功能函数：用于将含有56个子载波的数据进行归一化处理
% 使用的是线性函数归一化
function after_normalized = func_allNormalized(input)
    for i = 1:56
        tmp_input = input(i,:);
        after_normalized(i,:) = (tmp_input-min(tmp_input))./(max(tmp_input)-min(tmp_input));
    end
end