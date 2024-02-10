function one_Normalized = func_one_Normalized(input)
    
    one_Normalized = (input-min(input))./(max(input)-min(input));
    
end