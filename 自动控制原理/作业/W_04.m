s=tf('s');
g=4/(s*(0.2*s+1)*(0.4*s+1));
figure;
bode(g);
grid on;