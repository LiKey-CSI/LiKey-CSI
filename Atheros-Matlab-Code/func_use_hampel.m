%% 功能函数，使用Hampel滤波器去除异常值

function after_hampel = func_use_hampel(input_csi)
    after_hampel = zeros(56,length(input_csi));
    Window_size = 7;
    nsigma = 3;
    for i = 1:56
        after_hampel(i,:) = hampel(input_csi(i,:), Window_size, nsigma);
    end
end