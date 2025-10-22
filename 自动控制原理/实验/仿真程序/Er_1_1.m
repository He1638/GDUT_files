s = tf('s');
g = 100*((s+5)^2)/((s+1)*(s^2+s+9));
nyquist(g);
grid on;

sys = feedback(g,1);
step(sys);