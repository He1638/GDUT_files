num = 30;
den = [0.001 0.11 1 0];
g = tf(num,den);
bode(g);

num0 = 30;
numc = [0.23*5.15 1];
den0 = [0.001 0.11 1 0];
denc = [5.15 1];
g0 = tf(num0,den0);
gc = tf(numc,denc);
g = series(gc,g0);
bode(g);