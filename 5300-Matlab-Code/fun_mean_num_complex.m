function new_vector = fun_mean_num_complex(z,block_size)

    % 计算新向量的长度
    new_length = floor(length(z) / block_size);

    % 初始化新向量
    new_vector = zeros(1, new_length);

    % 对每个块进行平均操作
    for i = 1:new_length
        start_idx = (i - 1) * block_size + 1;
        end_idx = i * block_size;
        new_vector(i) = mean(z(start_idx:end_idx));
    end

end