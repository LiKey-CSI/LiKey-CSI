function new_vector = mean_50_complex(z)

    % ����ÿ����Ĵ�С
    block_size = 10;

    % �����������ĳ���
    new_length = floor(length(z) / block_size);

    % ��ʼ��������
    new_vector = zeros(1, new_length);

    % ��ÿ�������ƽ������
    for i = 1:new_length
        start_idx = (i - 1) * block_size + 1;
        end_idx = i * block_size;
        new_vector(i) = mean(z(start_idx:end_idx));
    end

end