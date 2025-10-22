num = 1;
den1 = [0.1 1];
den2 = [1 1];
den3 = [2 1];
den4 = [5 1];
den5 = [10 1];

g1 = tf(num, den1);
g2 = tf(num, den2);
g3 = tf(num, den3);
g4 = tf(num, den4);
g5 = tf(num, den5);

figure; 
step(g1);
hold on; 
step(g2);
step(g3);
step(g4);
step(g5);

legend('T=0.1', 'T=1', 'T=2', 'T=5', 'T=10');
grid on; 