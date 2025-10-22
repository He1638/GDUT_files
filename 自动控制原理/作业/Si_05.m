num = [10 1];       % 分子: 10s + 1
den = conv([1 -1 0], conv([0.2 1], [0.1 1])); % 分母: s(s+1)(0.2s+1)(0.1s+1)
sys = tf(num, den);
nyquist(sys);
grid on;