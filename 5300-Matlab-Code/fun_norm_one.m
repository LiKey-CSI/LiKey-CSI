%% ��һ������ 7��22����
function after_norm = fun_norm_one(input)

    for i = 1:size(input,1)
        tmp_input = input(i,:);
        after_norm(i,:) = (tmp_input-min(tmp_input))./(max(tmp_input)-min(tmp_input));
    end

end