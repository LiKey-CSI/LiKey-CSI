%% 功能函数：使用Savitzky-Golay进行滤波

function after_sg = func_sg(input_csi)
    win_len = 59;
    after_sg = zeros(56,length(input_csi));
    for i = 1:56
        after_sg(i,:) = sgolayfilt(input_csi(i,:),3,win_len);
    end
end