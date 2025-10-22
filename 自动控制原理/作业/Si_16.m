s=tf('s');
g=(0.6*s+1)*(0.25*s+1)/((s^2)*(s+1));
figure;
nyquist(g);

g=1/((s^2)*(s+1));
figure;
bode(g);
grid on;