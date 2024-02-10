function keytime_pair = fun_split_keystroke3(choose_data,mph)
%     choose_data = REV1_first_abs_csi;
    choose_data = (choose_data-min(choose_data))./(max(choose_data)-min(choose_data));
    choose_data = smoothdata(choose_data,'gaussian',400);
    figure;
    plot(choose_data);
    win_len = 200;
    record_var = [];
    for i = 1:length(choose_data)-win_len
       tmp_win_arr = choose_data(i:i+win_len-1);
       record_var = [record_var var(tmp_win_arr)];
    end
    figure;
    plot(record_var);
    
    mpd = 500;
    [pks,locs] = findpeaks(record_var,'minpeakheight',mph,'minpeakdistance',mpd);
    
    figure;
    plot(record_var);
    hold on;
    plot(locs,record_var(locs),'ro');
    hold off;
    
    store_index = locs;
    store_value = choose_data(store_index);
    
    choose_index = [];
    for i = 1:length(locs)
        tmp_index = store_index(i);
        if mod(i,2)==1
            if choose_data(tmp_index-1)>choose_data(tmp_index)
                while(choose_data(tmp_index-1)>choose_data(tmp_index))
                    %����Ѱ�Ҽ�ֵ��
                    tmp_index = tmp_index-1;
                end
            else
                %����Ѱ�Ҽ�ֵ��
                while(choose_data(tmp_index-1)<choose_data(tmp_index))
                    %����Ѱ�Ҽ�ֵ��
                    tmp_index = tmp_index-1;
                end
            end
        else
            if choose_data(tmp_index-1)>choose_data(tmp_index)
                while(choose_data(tmp_index-1)>choose_data(tmp_index))
                    %����Ѱ�Ҽ�ֵ��
                    tmp_index = tmp_index+1;
                end
            else
                %����Ѱ�Ҽ�ֵ��
                while(choose_data(tmp_index-1)<choose_data(tmp_index))
                    %����Ѱ�Ҽ�ֵ��
                    tmp_index = tmp_index+1;
                end
            end
        end
        choose_index = [choose_index tmp_index];
    end
    
    keytime_pair = [];
    for i = 1:2:length(choose_index)
        left_index = choose_index(i);
        right_index = choose_index(i+1);
        keytime_pair = [keytime_pair;left_index right_index];
    end
end