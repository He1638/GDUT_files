s=tf('s');
g=250/((s^2)*(s+5)*(s+15));
nyquist(g);
grid on;