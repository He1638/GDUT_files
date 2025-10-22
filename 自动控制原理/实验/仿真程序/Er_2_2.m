num = 1;
den = [1 1 0];
g = tf(num,den);
ga = tf(1,1);
gb = g;

g1 = series(ga,g);
g2 = series(gb,g);

bode(g1);
hold on;
bode(g2);

legend("a","b");