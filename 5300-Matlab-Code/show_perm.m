%展示perm的变化
function show_perm(csi_trace)
    perm_arr = zeros(length(csi_trace),3);
    for i=1:length(csi_trace)
        perm_arr(i,:) = csi_trace{i}.perm;
    end
    figure;
    plot(perm_arr(:,1),'o');
    hold on;
    plot(perm_arr(:,2),'o');
    plot(perm_arr(:,3),'o');
end