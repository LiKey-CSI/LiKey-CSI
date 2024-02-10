function first_principal_component = extract_first_principal_component(csi_data)
    % 数据标准化
    csi_data_std = zscore(csi_data);
    
    % 计算协方差矩阵
    cov_matrix = cov(csi_data_std);
    
    % 计算特征值和特征向量
    [eigenvectors, ~] = eig(cov_matrix);
    
    % 提取第一个主成分
    first_principal_component = csi_data_std * eigenvectors(:, 1);
end
