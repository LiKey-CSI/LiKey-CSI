%% 针对某个具体的按键观察其对应的复数运动
show_range = merge_keypair(2,:);


fig1_flag = 1;
fig2_flag = 1;
figure;
for n=show_range(1):show_range(2)
    subplot(2,1,1);
    hold on;
    plot(filter_REV1_ratio_r1r2(sub_carrier,n),'r.');
    hold off;
    if fig1_flag
        fig1_flag = 0;
        set(gca,'FontWeight','bold');
        title('Rev-W复数运动','FontWeight','bold','FontSize',14);
        xlabel('Real');
        ylabel('Imag');
    end
    subplot(2,1,2);
    hold on;
    plot(filter_REV2_ratio_r1r2(sub_carrier,n),'b.');
    hold off;
    if fig2_flag
        fig2_flag = 0;
        set(gca,'FontWeight','bold');
        title('Rev-Z复数运动','FontWeight','bold','FontSize',14);
        xlabel('Real');
        ylabel('Imag');
    end
    pause(0.001)
end


fig1_flag = 1;
fig2_flag = 1;
figure;
for n=show_range(1):show_range(2)
    subplot(2,1,1);
    hold on;
    plot(filter_REV1_ratio_r1r3(sub_carrier,n),'r.');
    hold off;
    if fig1_flag
        fig1_flag = 0;
        set(gca,'FontWeight','bold');
        title('Rev-W复数运动','FontWeight','bold','FontSize',14);
        xlabel('Real');
        ylabel('Imag');
    end
    subplot(2,1,2);
    hold on;
    plot(filter_REV2_ratio_r1r3(sub_carrier,n),'b.');
    hold off;
    if fig2_flag
        fig2_flag = 0;
        set(gca,'FontWeight','bold');
        title('Rev-Z复数运动','FontWeight','bold','FontSize',14);
        xlabel('Real');
        ylabel('Imag');
    end
    pause(0.001)
end

fig1_flag = 1;
fig2_flag = 1;
figure;
for n=show_range(1):show_range(2)
    subplot(2,1,1);
    hold on;
    plot(filter_REV1_ratio_r2r3(sub_carrier,n),'r.');
    hold off;
    if fig1_flag
        fig1_flag = 0;
        set(gca,'FontWeight','bold');
        title('Rev-W复数运动','FontWeight','bold','FontSize',14);
        xlabel('Real');
        ylabel('Imag');
    end
    subplot(2,1,2);
    hold on;
    plot(filter_REV2_ratio_r2r3(sub_carrier,n),'b.');
    hold off;
    if fig2_flag
        fig2_flag = 0;
        set(gca,'FontWeight','bold');
        title('Rev-Z复数运动','FontWeight','bold','FontSize',14);
        xlabel('Real');
        ylabel('Imag');
    end
    pause(0.001)
end