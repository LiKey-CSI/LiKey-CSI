function keytime_pair = fun_split_keystroke2(choose_data)
    choose_data = (choose_data-min(choose_data))./(max(choose_data)-min(choose_data));

    choose_data = smoothdata(choose_data,'gaussian',200);
%     choose_data = smoothdata(choose_data,'gaussian',100);

%     figure;
%     plot(choose_data);
%     
%     hil_data = hilbert(choose_data);
%     figure;
%     plot(abs(hil_data));

    [pks,locs] = findpeaks(choose_data);

    neg_choose_data = 1 - choose_data;
    [pks2,locs2] = findpeaks(neg_choose_data);


    figure;
    plot(choose_data);
    hold on;
    plot(locs,choose_data(locs,:),'ro');
    plot(locs2,choose_data(locs2,:),'go');
    hold off;

    %合并峰值索引和谷值索引
    store_index = sort([locs;locs2]);
    index_value = choose_data(store_index,:);

%     %剔除与相邻节点变化不大的索引
%     i = 1;
%     threshold = 0.2;
%     new_store_index = [];
%     new_index_value = [];
%     while i<length(store_index)
%        if (abs(index_value(i+1)-index_value(i))) < threshold
%            i = i+1;
%            continue;
%        end
%        new_store_index = [new_store_index store_index(i) store_index(i+1)];
%        new_index_value = [new_index_value index_value(i) index_value(i+1)];
%        i = i+2;
%     end
%     
%     figure;
%     plot(choose_data);
%     hold on;
%     plot(new_store_index,new_index_value,'ro');
%     hold off;
%     
%     
%     %从索引中寻找可能按键时间点
%     keytime_pair = [];
%     i = 1;
%     threshold = 0.2;
%     while i<length(new_store_index)
%        if(new_index_value
%         
%     end
    
    %从目前记录的索引值中寻找关键值
    i = 1;
    diff_threshold = 0.1;
    key_count = 0;
    keytime_pair = [];
    while i<length(store_index)
        if (abs(index_value(i+1)-index_value(i))) < diff_threshold
            i = i+1;
            continue;
        end
        tmp_set = store_index(i);
        i = i+1;
        %开始寻找本次按键的大致结束位置
        reverse_flag = 0;
        while i<length(store_index)
            if (abs(index_value(i+1)-index_value(i))) >= diff_threshold
                reverse_flag = 1;
                i = i+1;
                continue;
            end
            if reverse_flag==1
                tmp_set = [tmp_set store_index(i)];
                key_count = key_count + 1;
                i = i + 1;
                keytime_pair = [keytime_pair;tmp_set];
                tmp_set = [];
                break;
            else
                i = i + 1;
            end
        end
    end

    %对索引值进行调整
    %若前后两个索引值相差较大，则极有可能是不小心将一个按键分成了两个
%     i = 1;
%     while i<length(keytime_pair)
%         judg_index1 = keytime_pair(i,1);
%         judg_index2 = keytime_pair(i+1,1);
%         if(abs(choose_data(judg_index2)-choose_data(judg_index1)) > 0.25)
%            keytime_pair(i,2) = keytime_pair(i+1,2);
%            keytime_pair(i+1,:) = [];
%         else
%             i = i + 1;
%         end
%     end

    i = 1;
    while i<size(keytime_pair,1)
        if(keytime_pair(i,2)-keytime_pair(i,1))<300 || (keytime_pair(i,2)-keytime_pair(i,1))>2000
            keytime_pair(i,:) = [];
        else
            i = i+1;
        end
    end

    i = 1;
    while i<length(keytime_pair)
        judg_index1 = keytime_pair(i,2);
        judg_index2 = keytime_pair(i+1,1);
        if(judg_index2-judg_index1)<100
            keytime_pair(i,2) = keytime_pair(i+1,2);
            keytime_pair(i+1,:) = [];
        else
            i = i + 1;
        end
    end
    
    
    
    [row,col] = size(keytime_pair);
    if(keytime_pair(row,2)-keytime_pair(row,1))<300
        keytime_pair(row,:) = [];
    end
    
    
    
end