% 每个按键的开始和结束位置
clc;
clear;


csi_trace1 = read_bf_file('./data0704/0704Z/loc3_p111111_1.dat'); % 数据文件路径
csi_trace2 = read_bf_file('./data0704/0704W/loc3_p111111_1.dat'); % 数据文件路径

% csi_trace1 = read_bf_file('./0730/4/0730w/local5_p888888_2.dat'); % 数据文件路径
% csi_trace2 = read_bf_file('./0730/4/data0730/local5_p888888_2.dat');


REV1_t1_r1 = zeros(30,length(csi_trace1));
REV1_t1_r2 = zeros(30,length(csi_trace1));
REV1_t1_r3 = zeros(30,length(csi_trace1));
REV2_t1_r1 = zeros(30,length(csi_trace2));
REV2_t1_r2 = zeros(30,length(csi_trace2));
REV2_t1_r3 = zeros(30,length(csi_trace2));

for i = 1:length(csi_trace1)
    csi_entry = csi_trace1{i};
    csi = get_scaled_csi(csi_entry);
    REV1_t1_r1(:,i) = squeeze(csi(1,1,:));
    REV1_t1_r2(:,i) = squeeze(csi(1,2,:));
    REV1_t1_r3(:,i) = squeeze(csi(1,3,:));
end

for i = 1:length(csi_trace2)
    csi_entry = csi_trace2{i};
    csi = get_scaled_csi(csi_entry);
    REV2_t1_r1(:,i) = squeeze(csi(1,1,:));
    REV2_t1_r2(:,i) = squeeze(csi(1,2,:));
    REV2_t1_r3(:,i) = squeeze(csi(1,3,:));
end

%% 得到比率数据

REV1_ratio_r1r2 = REV1_t1_r1./REV1_t1_r2;

abs_REV1_ratio_r1r2 = func_sg(abs(REV1_ratio_r1r2));
phase_REV1_ratio_r1r2 = func_sg(angle(REV1_ratio_r1r2));

REV1_recomplie = abs_REV1_ratio_r1r2 .* exp(1i*phase_REV1_ratio_r1r2);

REV2_ratio_r1r2 = REV2_t1_r1./REV2_t1_r2;

abs_REV2_ratio_r1r2 = func_sg(abs(REV2_ratio_r1r2));
phase_REV2_ratio_r1r2 = func_sg(angle(REV2_ratio_r1r2));

REV2_recomplie = abs_REV2_ratio_r1r2 .* exp(1i*phase_REV2_ratio_r1r2);


show_range = 18100:19540;
fig1_flag = 1;
fig2_flag = 1;
figure;
for n=show_range
    subplot(2,1,1);
    hold on;
    if n==show_range(1)
        plot(REV1_recomplie(16,n),'r.','MarkerSize',30,'MarkerFaceColor','g','MarkerEdgeColor','g');
        text(real(REV1_recomplie(16,n)),imag(REV1_recomplie(16,n)),'Start point');
    elseif n==show_range(end)
        plot(REV1_recomplie(16,n),'r.','MarkerSize',30,'MarkerFaceColor','g','MarkerEdgeColor','g');
        text(real(REV1_recomplie(16,n)),imag(REV1_recomplie(16,n)),'End point');
    else
        plot(REV1_recomplie(16,n),'r.');
    end
    hold off;
    if fig1_flag
        fig1_flag = 0;
        set(gca,'FontWeight','bold');
        title('Receiver1-Complex Plane','FontWeight','bold','FontSize',14);
        xlabel('Real');
        ylabel('Imag');
    end
    subplot(2,1,2);
    hold on;
    if n==show_range(1)
        plot(REV2_recomplie(16,n),'r.','MarkerSize',30,'MarkerFaceColor','g','MarkerEdgeColor','g');
        text(real(REV2_recomplie(16,n)),imag(REV2_recomplie(16,n)),'Start point');
    elseif n==show_range(end)
        plot(REV2_recomplie(16,n),'r.','MarkerSize',30,'MarkerFaceColor','g','MarkerEdgeColor','g');
        text(real(REV2_recomplie(16,n)),imag(REV2_recomplie(16,n)),'End point');
    else
        plot(REV2_recomplie(16,n),'b.');
    end
    hold off;
    if fig2_flag
        fig2_flag = 0;
        set(gca,'FontWeight','bold');
        title('Receiver2-Complex Plane','FontWeight','bold','FontSize',14);
        xlabel('Real');
        ylabel('Imag');
    end
    pause(0.0001)
end
