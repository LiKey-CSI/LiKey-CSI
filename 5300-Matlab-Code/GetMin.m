%%功能函数：DTW算法中使用 
%用来得到三个值中的最小值，在计算DP矩阵时用到
function min = GetMin(a,b,c)
    if(a<=b && a <=c)
        min = a;
    elseif(b<=a && b<=c)
        min = b;
    elseif(c<=b && c<=a)
        min = c;
    end
end