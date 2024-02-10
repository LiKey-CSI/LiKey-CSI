%% ���ܺ�����ȥ��CSI��ֱ��ƫ��
% function corrected_csi = remove_dc_offset(csi_data)
%     num_subcarriers = size(csi_data, 2);
%     dc_offset = zeros(1, num_subcarriers);
%     
%     % ����ÿ�����ز���ֱ��ƫ��
%     for i = 1:num_subcarriers
%         subcarrier_data = csi_data(:, i);
%         dc_offset(i) = mean(subcarrier_data);
%     end
%     
%     % ȥ��ֱ��ƫ��
%     corrected_csi = csi_data - dc_offset;
% end

function corrected_csi = remove_dc_offset(csi_data)
    % ����CSI���ݵ�ʵ�����鲿
    real_part = real(csi_data);
    imag_part = imag(csi_data);
    
    % ����ʵ����ֱ��ƫ��
    real_part = real_part - mean(real_part, 2);
    
    % �����鲿��ֱ��ƫ��
    imag_part = imag_part - mean(imag_part, 2);
    
    % �������ʵ�����鲿���õ�����ֱ��ƫ�ƺ��CSI����
    corrected_csi = complex(real_part, imag_part);
end
