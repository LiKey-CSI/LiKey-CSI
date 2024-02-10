%% Savitzky-Golay 滤波 对30个子载波进行处理
function after_sg_csi = func_sg(raw_csi)
    win_len = 59;
    after_sg_csi = zeros(30,length(raw_csi));
    for i=1:30
        after_sg_csi(i,:) = sgolayfilt(raw_csi(i,:),3,win_len);
    end
end
