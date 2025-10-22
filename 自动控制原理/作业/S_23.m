num = [1 6];          % 分子: s + 6
den = conv([1 0], [1 6 18]); % 分母: s(s^2 + 6s + 18)
sys = tf(num, den);

figure;
rlocus(sys);
title('根轨迹: G(s) = K(s+6)/[s(s^2+6s+18)]');
xlabel('实轴');
ylabel('虚轴');
grid on;

% 标记极点和零点
hold on;
poles = roots(den);
zeros = roots(num);
plot(real(poles), imag(poles), 'rx', 'MarkerSize', 10);
plot(real(zeros), imag(zeros), 'ro', 'MarkerSize', 10);
legend('根轨迹', '极点', '零点');
hold off;