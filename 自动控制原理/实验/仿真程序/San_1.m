num = 10;
den = [1 1 0];
g = tf(num,den);
bode(g);

num0 = 10;
numc = [0.452 1];
den0 = [1 1 0];
denc = [0.113 1];
g0 = tf(num0,den0);
gc = tf(numc,denc);
g = series(gc,g0);
bode(g);