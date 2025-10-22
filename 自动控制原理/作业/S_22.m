% 定义开环传递函数 G(s)H(s) = K(s+1) / [s^2(s+5)]
num = [1 1];       % 分子多项式系数: K(s+1) → [1, 1]
den = [1 5 0 0];   % 分母多项式系数: s^2(s+5) → [1, 5, 0, 0]

% 创建传递函数模型
sys = tf(num, den);

% 绘制根轨迹
figure;
rlocus(sys);
title('根轨迹图: G(s)H(s) = K(s+1)/[s^2(s+5)]');
xlabel('实轴 (Re)');
ylabel('虚轴 (Im)');
grid on;

% 标记极点和零点
hold on;
poles = roots(den);    % 开环极点
zeros = roots(num);    % 开环零点
plot(real(poles), imag(poles), 'rx', 'MarkerSize', 10); % 极点用红叉
plot(real(zeros), imag(zeros), 'ro', 'MarkerSize', 10); % 零点用红圈
legend('根轨迹', '开环极点', '开环零点');
hold off;


% 设置坐标轴范围以清晰显示关键点
axis([-6 1 -3 3]);