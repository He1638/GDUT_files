num = 1;
den = [1 4 4 0];
sys = tf(num, den);
rlocus(sys);
% 劳斯判据验证：K=20 时系统临界稳定。