function pca_result = perform_pca(csi_data)
    % 数据标准化
    csi_data_std = zscore(csi_data);
    
    % 计算协方差矩阵
    cov_matrix = cov(csi_data_std);
    
    % 计算特征值和特征向量
    [eigenvectors, eigenvalues] = eig(cov_matrix);
    
    % 特征向量按照特征值从大到小排序
    [~, idx] = sort(diag(eigenvalues), 'descend');
    sorted_eigenvectors = eigenvectors(:, idx);
    
    % 选择主成分数量
    num_principal_components = min(size(csi_data, 2), 2); % 这里选择前2个主成分
    
    % 提取主成分
    principal_components = csi_data_std * sorted_eigenvectors(:, 1:num_principal_components);
    
    % 主成分得分
    scores = principal_components * diag(diag(eigenvalues(1:num_principal_components, 1:num_principal_components)).^(-1/2));
    
    % 返回主成分分析结果
    pca_result.principal_components = principal_components;
    pca_result.scores = scores;
end
