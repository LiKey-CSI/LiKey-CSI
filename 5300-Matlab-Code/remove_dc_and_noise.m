function filtered_csi = remove_dc_and_noise(csi_data, fs, fc_hp, fc_lp)
    % ��ͨ�˲������
    b_hp = designfilt('highpassfir', 'StopbandFrequency', fc_hp, 'PassbandFrequency', fc_hp + 1, 'PassbandRipple', 0.1, 'SampleRate', fs);
    
    % ��ͨ�˲������
    b_lp = designfilt('lowpassfir', 'StopbandFrequency', fc_lp + 1, 'PassbandFrequency', fc_lp, 'PassbandRipple', 0.1, 'SampleRate', fs);
    
    % ��ȡCSI���ݵ�ʵ�����鲿
    real_part = real(csi_data);
    imag_part = imag(csi_data);
    
    % ��ͨ�˲���ȥ��ʵ���ľ�̬����
    real_part_filtered = filtfilt(b_hp, real_part);
    
    % ��ͨ�˲���ȥ���鲿�ľ�̬����
    imag_part_filtered = filtfilt(b_hp, imag_part);
    
    % ��ͨ�˲���ȥ��ʵ�����鲿�ĸ�Ƶ����
    real_part_filtered = filtfilt(b_lp, real_part_filtered);
    imag_part_filtered = filtfilt(b_lp, imag_part_filtered);
    
    % �������ʵ�����鲿���õ��˲����CSI����
    filtered_csi = complex(real_part_filtered, imag_part_filtered);
end
