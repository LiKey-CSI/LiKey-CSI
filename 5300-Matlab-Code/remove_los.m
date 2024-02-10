function filtered_csi = remove_los(csi_data)
    num_antennas = size(csi_data, 2);  % 天线数量
    num_samples = size(csi_data, 1);  % 采样点数

    % 计算每个天线的权重
    beamforming_weights = ones(num_antennas, 1) / sqrt(num_antennas);
    
    % 应用空间滤波器（波束形成）
    filtered_csi = csi_data * beamforming_weights;
end

