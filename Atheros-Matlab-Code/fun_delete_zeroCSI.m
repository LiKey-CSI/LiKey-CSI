%% 功能函数：用于去除值为0的无效CSI

function csi_trace = fun_delete_zeroCSI(csi_trace)
    need_delete = [];
    for i=1:uint16(length(csi_trace))
        csi_entry = csi_trace{i};
        csi = csi_entry.csi;
        if(isequal(csi,0))
            need_delete = [need_delete i];
        end
    end
    for j = need_delete(:)
        csi_trace(j,:) = [];
    end
end