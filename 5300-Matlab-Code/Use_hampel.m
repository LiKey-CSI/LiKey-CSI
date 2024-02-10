function all_after_hampel = Use_hampel(ant_csi)
    all_after_hampel = zeros(30,length(ant_csi));
    for i = 1:30
        all_after_hampel(i,:) = my_Hampel_filter(ant_csi(i,:));
    end
end