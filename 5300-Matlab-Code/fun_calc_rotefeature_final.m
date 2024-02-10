function feature_arr = fun_calc_rotefeature_final(input_arr)

    feature_arr = [0];
    
    for i = 2:3
       first_value_real = real(input_arr(i-1));
       first_value_imag = imag(input_arr(i-1));
       middle_value_real = real(input_arr(i));
       middle_value_imag = imag(input_arr(i));
       vote_set = zeros(1,3);
       for j=i+1:1:i+3
           next_value_real = real(input_arr(j));
           next_value_imag = imag(input_arr(j));
           tmp_value = (middle_value_real-first_value_real)*(next_value_imag-middle_value_imag)-(middle_value_imag-first_value_imag)*(next_value_real-middle_value_real);
           disp(tmp_value);
           if(tmp_value>0)
               vote_set(j-i) = 1;
           else
               vote_set(j-i) = -1;
           end
       end
       feature_arr(i) = mode(vote_set);
    end
    
    for i = 4:length(input_arr)-1
       middle_value_real = real(input_arr(i));
       middle_value_imag = imag(input_arr(i));
       next_value_real = real(input_arr(i+1));
       next_value_imag = imag(input_arr(i+1));
       vote_set = zeros(1,3);
       for j = i-1:-1:i-3
           first_value_real = real(input_arr(j));
           first_value_imag = imag(input_arr(j));
           tmp_value = (middle_value_real-first_value_real)*(next_value_imag-middle_value_imag)-(middle_value_imag-first_value_imag)*(next_value_real-middle_value_real);
           disp(tmp_value);
           if(tmp_value>0)
               vote_set(i-j) = 1;
           else
               vote_set(i-j) = -1;
           end
       end
       feature_arr(i) = mode(vote_set);
    end

    feature_arr = feature_arr(2:end);
end