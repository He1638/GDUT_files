num0 = 1;
num1 = 1;
num2 = 2;
num3 = 5;
num4 = 10;
den0 = [1 1];
den1 = [1 2];
den2 = [1 3];
den3 = [1 6];
den4 = [1 11];

g0 = tf(num0, den0);
g1 = tf(num1, den1);
g2 = tf(num2, den2);
g3 = tf(num3, den3);
g4 = tf(num4, den4);

figure; 
step(g0);
hold on; 
step(g1);
step(g2);
step(g3);
step(g4);

legend('原函数','T=1,K=1', 'T=1,K=2', 'T=1,K=5', 'T=1,K=10');
grid on; 