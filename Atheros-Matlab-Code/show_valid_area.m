clc;
clear;

y = 50;
x = 3;
l = 1:100;
p = 0:1:90;
p1 = p*2*pi/360;

result = zeros(length(l),length(p));
reflect_Rev1 = zeros(length(l),length(p));
reflect_Rev2 = zeros(length(l),length(p));
pos_num = 0;
neg_num = 0;
zero_num = 0;

for i = 1:length(l)
    for j = 1:length(p1)
        if(x>sqrt(2)*l(i)*sin(p1(j)))
            reflect_Rev1(i,j) = 0;
            reflect_Rev2(i,j) = 0;
            continue;
        end
        reflect_Rev1(i,j) = -1 * (sqrt(y^2+l(i)^2-2*y*l(i)*cos(p1(j))) + l(i) - sqrt(l(i)^2-(2*sqrt(2)*x*l(i)*sin(p1(j))-2*x^2)) - sqrt(y^2+l(i)^2-2*y*l(i)*cos(p1(j))-(2*sqrt(2)*x*l(i)*sin(p1(j))-2*x^2)));
        reflect_Rev2(i,j) = -1 * (sqrt(y^2+l(i)^2-2*y*l(i)*sin(p1(j))) + l(i) - sqrt(l(i)^2-(2*sqrt(2)*x*l(i)*sin(p1(j))-2*x^2)) - sqrt(y^2+l(i)^2-2*y*l(i)*sin(p1(j))-(2*sqrt(2)*x*l(i)*sin(p1(j))-2*x^2)+2*sqrt(2)*x*y));
    end
end

figure;
imagesc(reflect_Rev1);
colorbar; % 添加颜色刻度
title({'$ d_1(t_2)-d_1(t_1) $'}, 'Interpreter', 'latex');
xlabel({'$ \theta $'}, 'Interpreter', 'latex');
ylabel({'$ l $'}, 'Interpreter', 'latex');


figure;
imagesc(reflect_Rev2);
colorbar; % 添加颜色刻度
title({'$ d_2(t_2)-d_2(t_1) $'}, 'Interpreter', 'latex');
xlabel({'$ \theta $'}, 'Interpreter', 'latex');
ylabel({'$ l $'}, 'Interpreter', 'latex');


for i = 1:length(l)
    for j = 1:length(p1)
        if(x>sqrt(2)*l(i)*sin(p1(j)))
            zero_num = zero_num + 1;
            result(i,j) = 0;
            continue;
        end
        shi1 = sqrt(y^2+l(i)^2-2*y*l(i)*cos(p1(j)))-sqrt(y^2+l(i)^2-2*y*l(i)*cos(p1(j))-(2*sqrt(2)*x*l(i)*sin(p1(j))-2*x^2));
        shi2 = sqrt(y^2+l(i)^2-2*y*l(i)*sin(p1(j)))-sqrt(y^2+l(i)^2-2*y*l(i)*sin(p1(j))-(2*sqrt(2)*x*l(i)*sin(p1(j))-2*x^2)+2*sqrt(2)*x*y);
        result(i,j) = shi1 - shi2;
        if(result(i,j)>0)
            pos_num = pos_num + 1;
            % result(i,j) = 1;
        else
            neg_num = neg_num + 1;
            % result(i,j) = -1;
        end
    end
end

% 使用 surf 函数绘制三维图
figure;
imagesc(result);
% 添加颜色栏
colorbar;
title({'$ (d_1(t_2)-d_1(t_1))-(d_2(t_2)-d_2(t_1)) $'}, 'Interpreter', 'latex');
xlabel({'$ \theta $'}, 'Interpreter', 'latex');
ylabel({'$ l $'}, 'Interpreter', 'latex');

% 添加标题和标签（可选）
title('3D Plot');
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');

% 设置视角（可选）
view(45, 30); % 通过改变视角以获得更好的观察效果


% 显示网格（可选）
grid on;