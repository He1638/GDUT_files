[u, t] = gensig('square', 6, 12, 0.1);  % 生成方波信号

num = [1, 1];       % 分子多项式系数
den = [1, 2, 5];    % 分母多项式系数
sys = tf(num, den); % 创建传递函数模型

lsim(sys, u, t); % 计算方波响应
grid on;