num = 2;
den = [1 10 32 48];
sys = tf(num, den);
rlocus(sys);
% 劳斯判据验证：K=20 时系统临界稳定。