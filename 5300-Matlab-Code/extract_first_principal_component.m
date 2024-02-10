function first_principal_component = extract_first_principal_component(csi_data)
    % ���ݱ�׼��
    csi_data_std = zscore(csi_data);
    
    % ����Э�������
    cov_matrix = cov(csi_data_std);
    
    % ��������ֵ����������
    [eigenvectors, ~] = eig(cov_matrix);
    
    % ��ȡ��һ�����ɷ�
    first_principal_component = csi_data_std * eigenvectors(:, 1);
end
