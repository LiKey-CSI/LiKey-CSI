%%Hample�˲�����ȥ�������е��쳣ֵ
function after_hampel = my_Hampel_filter(origin_data)
    Window_Size = 7;
    nsigma = 3;
    after_hampel = hampel(origin_data,Window_Size,nsigma);
end