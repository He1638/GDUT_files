s=tf('s');
g=40/(s*(s+2));
figure;
bode(g);
grid on;