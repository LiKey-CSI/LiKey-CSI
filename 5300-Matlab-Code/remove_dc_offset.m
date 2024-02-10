%% 功能函数：去除CSI的直流偏移
% function corrected_csi = remove_dc_offset(csi_data)
%     num_subcarriers = size(csi_data, 2);
%     dc_offset = zeros(1, num_subcarriers);
%     
%     % 计算每个子载波的直流偏移
%     for i = 1:num_subcarriers
%         subcarrier_data = csi_data(:, i);
%         dc_offset(i) = mean(subcarrier_data);
%     end
%     
%     % 去除直流偏移
%     corrected_csi = csi_data - dc_offset;
% end

function corrected_csi = remove_dc_offset(csi_data)
    % 分离CSI数据的实部和虚部
    real_part = real(csi_data);
    imag_part = imag(csi_data);
    
    % 消除实部的直流偏移
    real_part = real_part - mean(real_part, 2);
    
    % 消除虚部的直流偏移
    imag_part = imag_part - mean(imag_part, 2);
    
    % 重新组合实部和虚部，得到消除直流偏移后的CSI数据
    corrected_csi = complex(real_part, imag_part);
end
