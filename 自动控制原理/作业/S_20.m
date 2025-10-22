% 定义系统开环传递函数 G(s) = k*s / (s^2 + s + 1)
num = [1 0];      % 分子多项式系数: s → [1, 0]
den = [1 1 1];    % 分母多项式系数: s^2 + s + 1 → [1, 1, 1]

% 创建传递函数模型
sys = tf(num, den);

% 绘制根轨迹
figure;
rlocus(sys);
title('根轨迹图: G(s) = ks / (s^2 + s + 1)');
xlabel('实轴');
ylabel('虚轴');
grid on;

% 标记极点和零点
hold on;
poles = roots(den);    % 开环极点
zeros = roots(num);    % 开环零点
plot(real(poles), imag(poles), 'rx', 'MarkerSize', 10); % 用红叉标记极点
plot(real(zeros), imag(zeros), 'ro', 'MarkerSize', 10); % 用红圈标记零点
legend('根轨迹', '开环极点', '开环零点');
hold off;