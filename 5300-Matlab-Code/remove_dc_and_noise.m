function filtered_csi = remove_dc_and_noise(csi_data, fs, fc_hp, fc_lp)
    % 高通滤波器设计
    b_hp = designfilt('highpassfir', 'StopbandFrequency', fc_hp, 'PassbandFrequency', fc_hp + 1, 'PassbandRipple', 0.1, 'SampleRate', fs);
    
    % 低通滤波器设计
    b_lp = designfilt('lowpassfir', 'StopbandFrequency', fc_lp + 1, 'PassbandFrequency', fc_lp, 'PassbandRipple', 0.1, 'SampleRate', fs);
    
    % 提取CSI数据的实部和虚部
    real_part = real(csi_data);
    imag_part = imag(csi_data);
    
    % 高通滤波器去除实部的静态分量
    real_part_filtered = filtfilt(b_hp, real_part);
    
    % 高通滤波器去除虚部的静态分量
    imag_part_filtered = filtfilt(b_hp, imag_part);
    
    % 低通滤波器去除实部和虚部的高频噪声
    real_part_filtered = filtfilt(b_lp, real_part_filtered);
    imag_part_filtered = filtfilt(b_lp, imag_part_filtered);
    
    % 重新组合实部和虚部，得到滤波后的CSI数据
    filtered_csi = complex(real_part_filtered, imag_part_filtered);
end
