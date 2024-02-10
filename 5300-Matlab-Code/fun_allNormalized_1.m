%%功能函数：将30个子载波的数据全部归一化处理
%使用的是线性函数归一化
function all_Normalized = fun_allNormalized_1(after_butter)
    for i = 1:30
        tmp_after_butter = after_butter(i,:);
        all_Normalized(i,:) = (tmp_after_butter-min(tmp_after_butter))./(max(tmp_after_butter)-min(tmp_after_butter));
    end
end