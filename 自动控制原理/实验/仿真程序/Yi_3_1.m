omega_n = 1;
zeta = 0.7;
num = omega_n^2;
den = [1, 2*zeta*omega_n, omega_n^2];
g = tf(num, den);
step(g);


[y,t] = step(g);
[Y,k] = max(y);
tp = t(k);
peak = max(y);
overshoot = (peak-1)/1*100;
tr = t(find(y >= 0.9, 1))-t(find(y >= 0.1, 1));
ts = t(find(y >= 1.02, 1,"last"));

peak
tp
overshoot
tr
ts


info = stepinfo(g);
peak = info.Peak;
tp = info.PeakTime;
overshoot = info.Overshoot;
tr = info.RiseTime;
ts= info.SettlingTime;