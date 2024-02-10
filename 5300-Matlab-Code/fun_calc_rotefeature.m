function feature_arr = fun_calc_rotefeature(input_arr)

    feature_arr = [];
    
    for i = 2:length(input_arr)-1
       first_value_real = real(input_arr(i-1));
       first_value_imag = imag(input_arr(i-1));
       middle_value_real = real(input_arr(i));
       middle_value_imag = imag(input_arr(i));
       next_value_real = real(input_arr(i+1));
       next_value_imag = imag(input_arr(i+1));
       feature_arr(i-1) = (middle_value_real-first_value_real)*(next_value_imag-middle_value_imag)-(middle_value_imag-first_value_imag)*(next_value_real-middle_value_real);
    end

    for i=1:length(feature_arr)
        if(feature_arr(i)>0)
            feature_arr(i) = 1;
        else
            feature_arr(i) = -1;
        end
    end
end