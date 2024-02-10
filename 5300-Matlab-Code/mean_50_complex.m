function new_vector = mean_50_complex(z)

    % 定义每个块的大小
    block_size = 10;

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