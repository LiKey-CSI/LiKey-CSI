%%���ܺ�����DTW�㷨��ʹ�� 
%�����õ�����ֵ�е���Сֵ���ڼ���DP����ʱ�õ�
function min = GetMin(a,b,c)
    if(a<=b && a <=c)
        min = a;
    elseif(b<=a && b<=c)
        min = b;
    elseif(c<=b && c<=a)
        min = c;
    end
end