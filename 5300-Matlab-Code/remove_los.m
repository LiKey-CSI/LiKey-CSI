function filtered_csi = remove_los(csi_data)
    num_antennas = size(csi_data, 2);  % ��������
    num_samples = size(csi_data, 1);  % ��������

    % ����ÿ�����ߵ�Ȩ��
    beamforming_weights = ones(num_antennas, 1) / sqrt(num_antennas);
    
    % Ӧ�ÿռ��˲����������γɣ�
    filtered_csi = csi_data * beamforming_weights;
end

