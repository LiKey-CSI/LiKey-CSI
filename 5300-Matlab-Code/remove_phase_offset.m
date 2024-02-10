function corrected_csi = remove_phase_offset(csi_data)
    num_samples = size(csi_data, 1);
    num_subcarriers = 30;
    num_antennas = size(csi_data, 2) / num_subcarriers;
    num_subcarriers = size(csi_data, 2) / num_antennas;

    % 选择参考天线
    reference_antenna = 1;

    % 提取参考子载波
    reference_subcarriers = (reference_antenna-1) * num_subcarriers + 1 : reference_antenna * num_subcarriers;
    reference_phase = angle(csi_data(:, reference_subcarriers));

    % 消除相位偏移
    corrected_csi = csi_data;
    for i = 1:num_antennas
        if i ~= reference_antenna
            subcarriers = (i-1) * num_subcarriers + 1 : i * num_subcarriers;
            phase_offset = angle(csi_data(:, subcarriers)) - reference_phase;
            corrected_csi(:, subcarriers) = abs(csi_data(:, subcarriers)) .* exp(1i * phase_offset);
        end
    end
end


