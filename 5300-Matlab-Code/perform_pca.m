function pca_result = perform_pca(csi_data)
    % ���ݱ�׼��
    csi_data_std = zscore(csi_data);
    
    % ����Э�������
    cov_matrix = cov(csi_data_std);
    
    % ��������ֵ����������
    [eigenvectors, eigenvalues] = eig(cov_matrix);
    
    % ����������������ֵ�Ӵ�С����
    [~, idx] = sort(diag(eigenvalues), 'descend');
    sorted_eigenvectors = eigenvectors(:, idx);
    
    % ѡ�����ɷ�����
    num_principal_components = min(size(csi_data, 2), 2); % ����ѡ��ǰ2�����ɷ�
    
    % ��ȡ���ɷ�
    principal_components = csi_data_std * sorted_eigenvectors(:, 1:num_principal_components);
    
    % ���ɷֵ÷�
    scores = principal_components * diag(diag(eigenvalues(1:num_principal_components, 1:num_principal_components)).^(-1/2));
    
    % �������ɷַ������
    pca_result.principal_components = principal_components;
    pca_result.scores = scores;
end
