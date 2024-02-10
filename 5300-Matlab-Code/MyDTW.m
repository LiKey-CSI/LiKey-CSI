%%DWT�㷨����Ҫ���ܺ���
function DP_distance = MyDTW(x,y)
    %x,y�������Ƚ����ƶȵ�����
    x_len = length(x);
    y_len = length(y);
%     plot(1:x_len,x);hold on
%     plot(1:y_len,y);hold on
    %����������ÿ��������ľ������
    distance = zeros(x_len,y_len);
    for i=1:x_len
        for j=1:y_len
            distance(i,j) = (x(i)-y(j)).^2;
        end
    end

    %�����������е��ۻ��������
    DP = zeros(x_len,y_len);
    DP(1,1) = distance(1,1);
    for i=2:x_len
        DP(i,1) = distance(i,1)+DP(i-1,1);
    end
    for j=2:y_len
        DP(1,j) = distance(1,j)+DP(1,j-1);
    end
    for i=2:x_len
        for j=2:y_len
            DP(i,j) = distance(i,j) + GetMin(DP(i-1,j),DP(i,j-1),DP(i-1,j-1));
        end
    end

    %���ݣ��ҵ�����������֮���ƥ���ϵ
    i = x_len;
    j = y_len;
    while(~((i == 1)&&(j==1)))
%         plot([i,j],[x(i),y(j)],'b');hold on %����ƥ��֮���������֮���ƥ���ϵ
        if(i==1)
            index_i = 1;
            index_j = j-1;
        elseif(j==1)
            index_i = i-1;
            index_j = 1;
        else
        [index_i,index_j] = GetMinIndex(DP(i-1,j-1),DP(i-1,j),DP(i,j-1),i,j);
        end
        i = index_i;
        j = index_j;
    end
    
    [size1,size2] = size(DP);
    DP_distance = DP(size1,size2);
end
